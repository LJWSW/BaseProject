//
//  NSObject+WFZ_AFNetworking.h
//  BaseProject
//
//  Created by 吴福增 on 2016/12/30.
//  Copyright © 2016年 wufuzeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking.h>
//电池条上网络活动提示(菊花转动)
#import <AFNetworkActivityIndicatorManager.h>

/*
 请求类型:Get Post
 Get: 传递小型数据, 数据
 Post: 传递大型数据, 传zip/图片/音乐...
 具体使用哪个请求: 由服务器人员规定
 */

#define kCompletionHandle  completionHandle:(void(^)(id model, NSError* error))completionHandle;

@interface NSObject (WFZ_AFNetworking)

/**
 *  监控网络类型
 *
 *  wifi,蜂窝网络,没有网
 */
-(void)monitorNetworkSyle;


+ (id)GET:(NSString *)path parameters:(NSDictionary *)params kCompletionHandle

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params kCompletionHandle

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
+(id)POST_UPLOAD:(NSString *)path parameters:(NSDictionary *)params FileData:(NSData *)fileData Name:(NSString *)name FileName:(NSString *)fileName mimeType:(NSString *)mimeType progress:(void(^)(NSProgress *))progress kCompletionHandle;

@end
