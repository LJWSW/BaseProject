//
//  XFNetManager.m
//  RedAntExpress
//
//  Created by 蒋旭峰 on 17/7/12.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "XFNetManager.h"


@implementation XFNetManager

/**
 *  遇到链接中有无包含op的问题，修改此处拼接方式即可
 */
#define G_DETAIL_URL(BaseUrl,OpName) [NSString stringWithFormat:@"%@/%@?",BaseUrl,OpName]
//#define G_DETAIL_URL(BaseUrl,OpName) [NSString stringWithFormat:@"%@?",BaseUrl] //op作为参数写在dicParams



/**
 *  默认移除html标签的get方法
 */
+ (void)GetByBaseUrl:(NSString *)baseUrl Op:(NSString *)OpName bNeedProgress:(BOOL)bNeedProgress delegate:(id<XFNetManagerDelegate>)delegate failHandle:(void (^)(NSError *error))failHandle Params:(NSDictionary *)dicParams
{
    [self GetByBaseUrl:baseUrl Op:OpName Params:dicParams bNeedProgress:bNeedProgress bNeedRemoveHtml:YES delegate:delegate failHandle:failHandle];
}

/**
 *  默认移除html标签的post方法
 */
+ (void)PostByBaseUrl:(NSString *)baseUrl Op:(NSString *)OpName bNeedProgress:(BOOL)bNeedProgress delegate:(id<XFNetManagerDelegate>)delegate failHandle:(void (^)(NSError *error))failHandle AppendingParams:(NSDictionary *)dicAppendParams Params:(NSDictionary *)dicParams
{
    [self PostByBaseUrl:baseUrl Op:OpName AppendingParams:dicAppendParams Params:dicParams bNeedProgress:bNeedProgress bNeedRemoveHtml:YES delegate:delegate failHandle:failHandle];
}

/**
 *  上传图片
 */
+ (void)PostUploadByBaseUrl:(NSString *)baseUrl
                         Op:(NSString *)OpName
            AppendingParams:(NSDictionary *)dicAppendParams
                     Params:(NSDictionary *)dicParams
                   FileData:(NSData *)filedata
                   delegate:(id<XFNetManagerDelegate>)delegate
                   Progress:(void (^)(NSProgress *progress))progress
                 FailHandle:(void (^)(NSError *error))failHandle
{
    [self PostUploadByBaseUrl:baseUrl Op:OpName AppendingParams:dicAppendParams Params:dicParams FileData:filedata Name:@"upload" FileName:@"upload.jpg" MimeType:@"jpg" delegate:delegate bShowProgress:YES Progress:progress FailHandle:failHandle];
}

/**
 *  基础get方法
 */
+ (void)GetByBaseUrl:(NSString *)baseUrl Op:(NSString *)OpName Params:(NSDictionary *)dicParams bNeedProgress:(BOOL)bNeedProgress bNeedRemoveHtml:(BOOL)bNeedRemoveHtml delegate:(id<XFNetManagerDelegate>)delegate failHandle:(void (^)(NSError *error))failHandle
{
    if (bNeedProgress) [SVProgressHUD show];
    
    __block NSString *strUrl = [NSString stringWithFormat:@"%@",G_DETAIL_URL(baseUrl, OpName)];
    
    __block int i = 0;
    
    [dicParams enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        if ([obj  isEqual: @""])
        {
            
        }
        else
        {
            if (i == 0)
            {
                strUrl = [strUrl stringByAppendingFormat:@"%@=%@",key,obj];
            }
            else
            {
                strUrl = [strUrl stringByAppendingFormat:@"&%@=%@",key,obj];
            }
        }
        i++;
    }];

    
    [[self sharedAFManager] GET:G_DETAIL_URL(baseUrl, OpName) parameters:dicParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (bNeedProgress) [SVProgressHUD dismiss];
        
        if (bNeedRemoveHtml)
        {
            NSString *strResponseObject = [self removeHTML:[responseObject mj_JSONString]];
            responseObject = [strResponseObject dataUsingEncoding:NSUTF8StringEncoding];
        }
        
        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"提交参数 ----------------------\n%@ \nstrUrl ----------------------\n%@ \ndicData ----------------------\n%@",dicParams,strUrl,dicData);
        
        if ([delegate respondsToSelector:@selector(callBackWithOpName:Params:AppendingParams:andData:)])
        {
            [delegate callBackWithOpName:OpName Params:nil AppendingParams:dicParams andData:dicData];
        }
        else if ([delegate respondsToSelector:@selector(callBackWithOpName:andData:)])
        {
            [delegate callBackWithOpName:OpName andData:dicData];
        }
        else
        {
            NSLog(@"代理方法尚未实现");
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"提交参数 ----------------------\n%@ \nstrUrl ----------------------\n%@",dicParams,strUrl);
        
        NSLog(@"error ----- %@",error);
        if (bNeedProgress) [SVProgressHUD dismiss];
        if (bNeedProgress) [SVProgressHUD showErrorWithStatus:error.userInfo[@"NSLocalizedDescription"]];
        failHandle(error);
        
    }];

}



/**
 *  基础post方法
 */
+ (void)PostByBaseUrl:(NSString *)baseUrl Op:(NSString *)OpName AppendingParams:(NSDictionary *)dicAppendParams Params:(NSDictionary *)dicParams bNeedProgress:(BOOL)bNeedProgress bNeedRemoveHtml:(BOOL)bNeedRemoveHtml delegate:(id<XFNetManagerDelegate>)delegate failHandle:(void (^)(NSError *error))failHandle
{
    if (bNeedProgress) [SVProgressHUD show];
    
    __block NSString *strUrl = [NSString stringWithFormat:@"%@",G_DETAIL_URL(baseUrl, OpName)];
    
    __block int i = 0;
    
    [dicAppendParams enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        if (i == 0)
        {
            strUrl = [strUrl stringByAppendingFormat:@"%@=%@",key,obj];
        }
        else
        {
            strUrl = [strUrl stringByAppendingFormat:@"&%@=%@",key,obj];
        }
        
        i++;
    }];
    
    NSLog(@"提交参数 ----- %@",dicParams);
    NSLog(@"strUrl ----- %@",strUrl);
    
    [[self sharedAFManager] POST:strUrl parameters:dicParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (bNeedProgress) [SVProgressHUD dismiss];
        
        if (bNeedRemoveHtml)
        {
            NSString *strResponseObject = [self removeHTML:[responseObject mj_JSONString]];
            responseObject = [strResponseObject dataUsingEncoding:NSUTF8StringEncoding];
        }
        
        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"dicData ----- %@",dicData);
        
        if ([delegate respondsToSelector:@selector(callBackWithOpName:Params:AppendingParams:andData:)])
        {
            [delegate callBackWithOpName:OpName Params:dicParams AppendingParams:dicAppendParams andData:dicData];
        }
        else if ([delegate respondsToSelector:@selector(callBackWithOpName:andData:)])
        {
            [delegate callBackWithOpName:OpName andData:dicData];
        }
        else
        {
            NSLog(@"代理方法尚未实现");
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error ----- %@",error);
        if (bNeedProgress) [SVProgressHUD dismiss];
        if (bNeedProgress) [SVProgressHUD showErrorWithStatus:error.userInfo[@"NSLocalizedDescription"]];
        failHandle(error);
    }];
}

+ (void)PostUploadByBaseUrl:(NSString *)baseUrl
                         Op:(NSString *)OpName
            AppendingParams:(NSDictionary *)dicAppendParams
                     Params:(NSDictionary *)dicParams
                   FileData:(NSData *)filedata
                       Name:(NSString *)name
                   FileName:(NSString *)fileName
                   MimeType:(NSString *)mimeType
              bShowProgress:(BOOL)bNeedProgress
                   Progress:(void (^)(NSProgress *progress))progress
              SuccessHandel:(void (^)(NSDictionary *dicResponse))successHandel
                 FailHandle:(void (^)(NSError *error))failHandle
{
    if (bNeedProgress) [SVProgressHUD showProgress:0.0 status:@"上传中 0.0%"];
    
    __block NSString *strUrl = [NSString stringWithFormat:@"%@",G_DETAIL_URL(baseUrl, OpName)];
    
    __block int i = 0;
    
    [dicAppendParams enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        if (i == 0)
        {
            strUrl = [strUrl stringByAppendingFormat:@"%@=%@",key,obj];
        }
        else
        {
            strUrl = [strUrl stringByAppendingFormat:@"&%@=%@",key,obj];
        }
        
        i++;
    }];
    
    NSLog(@"提交参数 ----- %@",dicParams);
    NSLog(@"strUrl ----- %@",strUrl);
    
    [[self sharedAFManager] POST:strUrl parameters:dicParams constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:filedata
                                    name:name
                                fileName:fileName
                                mimeType:mimeType];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (bNeedProgress) [SVProgressHUD showProgress:uploadProgress.fractionCompleted status:[NSString stringWithFormat:@"上传中 %.1f%%",uploadProgress.fractionCompleted * 100]];
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (bNeedProgress) [SVProgressHUD dismiss];
        
        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"dicData ----- %@",dicData);
        
        successHandel(dicData);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error ----- %@",error);
        if (bNeedProgress) [SVProgressHUD dismiss];
        if (bNeedProgress) [SVProgressHUD showErrorWithStatus:error.userInfo[@"NSLocalizedDescription"]];
        failHandle(error);
    }];
}

/**
 *  基础上传图片
 */
+ (void)PostUploadByBaseUrl:(NSString *)baseUrl
                         Op:(NSString *)OpName
            AppendingParams:(NSDictionary *)dicAppendParams
                     Params:(NSDictionary *)dicParams
                   FileData:(NSData *)filedata
                       Name:(NSString *)name
                   FileName:(NSString *)fileName
                   MimeType:(NSString *)mimeType
                   delegate:(id<XFNetManagerDelegate>)delegate
              bShowProgress:(BOOL)bNeedProgress
                   Progress:(void (^)(NSProgress *progress))progress
                 FailHandle:(void (^)(NSError *error))failHandle
{
    if (bNeedProgress) [SVProgressHUD showProgress:0.0 status:@"上传中 0.0%"];
    
    __block NSString *strUrl = [NSString stringWithFormat:@"%@",G_DETAIL_URL(baseUrl, OpName)];
    
    __block int i = 0;
    
    [dicAppendParams enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        if (i == 0)
        {
            strUrl = [strUrl stringByAppendingFormat:@"%@=%@",key,obj];
        }
        else
        {
            strUrl = [strUrl stringByAppendingFormat:@"&%@=%@",key,obj];
        }
        
        i++;
    }];
    
    NSLog(@"提交参数 ----- %@",dicParams);
    NSLog(@"strUrl ----- %@",strUrl);
    
    [[self sharedAFManager] POST:strUrl parameters:dicParams constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:filedata
                                    name:name
                                fileName:fileName
                                mimeType:mimeType];

    } progress:^(NSProgress * _Nonnull uploadProgress) {

        if (bNeedProgress) [SVProgressHUD showProgress:uploadProgress.fractionCompleted status:[NSString stringWithFormat:@"上传中 %.1f%%",uploadProgress.fractionCompleted * 100]];
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (bNeedProgress) [SVProgressHUD dismiss];
        
        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"dicData ----- %@",dicData);
        
        if ([delegate respondsToSelector:@selector(callBackWithOpName:Params:AppendingParams:andData:)])
        {
            [delegate callBackWithOpName:OpName Params:dicParams AppendingParams:dicAppendParams andData:dicData];
        }
        else if ([delegate respondsToSelector:@selector(callBackWithOpName:andData:)])
        {
            [delegate callBackWithOpName:OpName andData:dicData];
        }
        else
        {
            NSLog(@"代理方法尚未实现");
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error ----- %@",error);
        if (bNeedProgress) [SVProgressHUD dismiss];
        if (bNeedProgress) [SVProgressHUD showErrorWithStatus:error.userInfo[@"NSLocalizedDescription"]];
        failHandle(error);
    }];
}



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
                NSLog(@"当前是wifi环境");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"当前无网络");
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"当前网络未知");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"当前是蜂窝网络");
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
        
        
        manager.requestSerializer.timeoutInterval         = 15;
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/json",@"text/javascript",@"text/plain", nil];
    });
    return manager;
}

/**
 *  过滤html标签
 */
+ (NSString *)removeHTML:(NSString *)html
{
    html = [html stringByReplacingOccurrencesOfString:@"<(.[^>]*)>" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"([\r\n])[\\s]+" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"../" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\r\n" withString:@"\\n"];
    html = [html stringByReplacingOccurrencesOfString:@"<br />" withString:@"\\n"];
    html = [html stringByReplacingOccurrencesOfString:@"<br>" withString:@"\\n"];
    html = [html stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    html = [html stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"<span>" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"</span>" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\u00a0" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\\n" withString:@""];
    return html;
}

@end
