//
//  NSObject+WFZ_AFNetworking.m
//  BaseProject
//
//  Created by 吴福增 on 2016/12/30.
//  Copyright © 2016年 wufuzeng. All rights reserved.
//

#import "NSObject+WFZ_AFNetworking.h"

@implementation NSObject (WFZ_AFNetworking)


/**
 *  监控网络类型
 *
 *  wifi,蜂窝网络,没有网
 */
-(void)monitorNetworkSyle
{
    //当使用AF发送网络请求时,是否在状态栏显示菊花提示
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    //能够检测当前网络是wifi,蜂窝网络,没有网
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 网络发生变化时 会触发这里的代码
        switch (status) {
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                DDLogVerbose(@"当前是wifi环境");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                DDLogVerbose(@"当前无网络");
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                DDLogVerbose(@"当前网络未知");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                DDLogVerbose(@"当前是蜂窝网络");
                break;
                
            default:
                break;
        }
    }];
    
    //开启网络检测
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    //网络活动发生变化时,会发送下方key 的通知,可以在通知中心中添加检测
    //AFNetworkingReachabilityDidChangeNotification
    /*
     [[NSNotificationCenter defaultCenter] addObserver:nil selector:nil name:AFNetworkingReachabilityDidChangeNotification object:nil];
     */
    
    
}


/**
 *  单例
 */
+ (AFHTTPSessionManager *)sharedAFManager
{
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        manager=[AFHTTPSessionManager manager];
        
        //[manager.requestSerializer setValue:nil forHTTPHeaderField:nil];
        
        manager.requestSerializer  = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];

        
        manager.requestSerializer.timeoutInterval         = 10;
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/json",@"text/javascript",@"text/plain", nil];
    });
    return manager;
}



+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle{
    
    [NSObject showBusy:nil];
    
    return [[self sharedAFManager] GET:path parameters:params
                              progress:nil
                               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
            
    {
          [NSObject hideProgress];
          completionHandle(responseObject, nil);
    }
                               failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
          [NSObject hideProgress];
          [NSObject showError:error.userInfo[@"NSLocalizedDescription"]];
          completionHandle(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle{
    
    [NSObject showBusy:nil];
    
    return [[self sharedAFManager] POST:path parameters:params
                               progress:nil
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
       [NSObject hideProgress];
       completionHandle(responseObject, nil);
    }
                                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
       [NSObject hideProgress];
       [NSObject showError:error.userInfo[@"NSLocalizedDescription"]];
       completionHandle(nil, error);
    }];
    
}


/**
 *  post 上传
 *
 *  @param path     base_url
 *  @param params   params
 *  @param fileData 文件数据
 *  @param name     服务器端确定的字段
 *  @param fileName 服务器端保存的名字
 *  @param mimeType 上传数据类型 eg:@"image/jpeg"
 *
 *  @return id
 */
+(id)POST_UPLOAD:(NSString *)path
      parameters:(NSDictionary *)params
        FileData:(NSData*)fileData
            Name:(NSString*)name
        FileName:(NSString*)fileName
        mimeType:(NSString*)mimeType
        progress:(void(^)(NSProgress *))progress
completionHandle:(void (^)(id, NSError *))completionHandle{
    
     [NSObject showBusy:nil];
    
    return [[self sharedAFManager] POST:path parameters:params
              constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
    {
      [formData appendPartWithFileData:fileData
                                  name:name
                              fileName:fileName
                              mimeType:mimeType];
    }
                               progress:^(NSProgress * _Nonnull uploadProgress)
    {
        progress(uploadProgress);
    }
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
      [NSObject hideProgress];
      completionHandle(responseObject,nil);
      
    }
                                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
      [NSObject hideProgress];
      [NSObject showError:error.userInfo[@"NSLocalizedDescription"]];
      completionHandle(nil, error);
    }];
}




+ (id)PUT:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle{
    
     [NSObject showBusy:nil];
    
    return [[self sharedAFManager] PUT:path parameters:params
                               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
       [NSObject hideProgress];
       completionHandle(responseObject,nil);
       
    }
                               failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
       [NSObject hideProgress];
       [NSObject showError:error.userInfo[@"NSLocalizedDescription"]];
       completionHandle(nil, error);
    }];
    
    
}


#pragma private method -------


/**
 *  设置COOKIE
 *  时机：请求服务器前
 */
+(void)SETCOOKIE{
    
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:@"kUserLoginCookie"];
    if([cookiesdata length])
    {
        NSArray * cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        for (NSHTTPCookie *cookie in cookies)
        {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        }
    }
}

/**
 *  返回COOKIE
 *  时机：请求成功后
 */
+(void)GETCOOKIE{
    
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *cookies               = [cookieJar cookies];
    NSData *data                   = [NSKeyedArchiver archivedDataWithRootObject:cookies];
    
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"kUserLoginCookie"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
