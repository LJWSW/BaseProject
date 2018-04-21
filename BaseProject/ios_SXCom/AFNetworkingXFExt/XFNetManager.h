//
//  XFNetManager.h
//  RedAntExpress
//
//  Created by 蒋旭峰 on 17/7/12.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>


@class AFHTTPSessionManager;

@protocol XFNetManagerDelegate <NSObject>

- (void)callBackWithOpName:(NSString *)strOpName andData:(id)responseData;

- (void)callBackWithOpName:(NSString *)strOpName Params:(NSDictionary *)dicParams AppendingParams:(NSDictionary *)dicAppendParams andData:(id)responseData;

@end

@interface XFNetManager : NSObject

/**
 *  获得单例
 */
+ (AFHTTPSessionManager *)sharedAFManager;

/**
 *  监控网络类型
 *
 *  wifi,蜂窝网络,没有网
 */
-(void)monitorNetworkSyle;


/**
 *  默认移除html标签的get方法
 */
+ (void)GetByBaseUrl:(NSString *)baseUrl Op:(NSString *)OpName bNeedProgress:(BOOL)bNeedProgress delegate:(id<XFNetManagerDelegate>)delegate failHandle:(void (^)(NSError *error))failHandle Params:(NSDictionary *)dicParams;

/**
 *  默认移除html标签的post方法
 */
+ (void)PostByBaseUrl:(NSString *)baseUrl Op:(NSString *)OpName bNeedProgress:(BOOL)bNeedProgress delegate:(id<XFNetManagerDelegate>)delegate failHandle:(void (^)(NSError *error))failHandle AppendingParams:(NSDictionary *)dicAppendParams Params:(NSDictionary *)dicParams;

/**
 *  上传图片
 */
+ (void)PostUploadByBaseUrl:(NSString *)baseUrl
                         Op:(NSString *)OpName
            AppendingParams:(NSDictionary *)dicAppendParams
                     Params:(NSDictionary *)dicParams
                   FileData:(NSData *)filedata
                   delegate:(id<XFNetManagerDelegate>)delegate
                   Progress:(void(^)(NSProgress *progress))progress
                 FailHandle:(void (^)(NSError *error))failHandle;



/**
 *  基础get方法
 */
+ (void)GetByBaseUrl:(NSString *)baseUrl Op:(NSString *)OpName Params:(NSDictionary *)dicParams bNeedProgress:(BOOL)bNeedProgress bNeedRemoveHtml:(BOOL)bNeedRemoveHtml delegate:(id<XFNetManagerDelegate>)delegate failHandle:(void (^)(NSError *error))failHandle;

/**
 *  基础post方法
 */
+ (void)PostByBaseUrl:(NSString *)baseUrl Op:(NSString *)OpName AppendingParams:(NSDictionary *)dicAppendParams Params:(NSDictionary *)dicParams bNeedProgress:(BOOL)bNeedProgress bNeedRemoveHtml:(BOOL)bNeedRemoveHtml delegate:(id<XFNetManagerDelegate>)delegate failHandle:(void (^)(NSError *error))failHandle;

/**
 *  基础上传图片block版
 */
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
                 FailHandle:(void (^)(NSError *error))failHandle;

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
                   Progress:(void(^)(NSProgress *progress))progress
                 FailHandle:(void (^)(NSError *error))failHandle;

@end
