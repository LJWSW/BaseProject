//
//  LMNetManager.h
//  BaseProject
//
//  Created by 楼某人 on 2018/4/14.
//  Copyright © 2018年 楼某人. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LMNetManagerDelegate <NSObject>

@optional

- (void)callBackWithOpName:(NSString *)opName andData:(id)responseData;

- (void)callBackWithOpName:(NSString *)opName Params:(NSDictionary *)dicParams AppendingParams:(NSDictionary *)dicAppendParams andData:(id)responseData;

@end

@interface LMNetManager : NSObject

/**
 *  获取单例
 */
+ (AFHTTPSessionManager *)sharedManager;

/**
 *  监控网络类型
 *
 *  wifi 蜂窝网络  没网
 */
- (void)monitorNetworkStyle;

/**
 *  代理方式
 */

//默认移除html标签
+ (void)GetBaseUrl:(NSString *)baseUrl andOp:(NSString *)opName bNeedProgress:(BOOL)bNeedProgress delegate:(id<LMNetManagerDelegate>)delegate failHandler:(void(^)(NSError *error))failhandler Params:(NSDictionary *)dicParams;


+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id model, NSError *error))completionHandler;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionhandler:(void(^)(id model, NSError *error))completionHandler;

@end
