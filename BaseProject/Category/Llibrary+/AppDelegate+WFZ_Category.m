//
//  AppDelegate+WFZ_Category.m
//  BaseProject
//
//  Created by wufuzeng on 15/12/16.
//  Copyright © 2015年 wufuzeng. All rights reserved.
//

#import "AppDelegate+WFZ_Category.h"

#import "NSObject+WFZ_AFNetworking.h"

//#import <JPUSHService.h>


@implementation AppDelegate (WFZ_Category)
- (void)initializeWithApplication:(UIApplication *)application launchOptions:(NSDictionary *)launchOptions{
    
//    [WXApi registerApp:WXKey];
    

    // 禁用IQKeyboardManager
//    [[IQKeyboardManager sharedManager] setEnable:NO];
//    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
    
    //DDLog：基础类，必须引入的。
    //DDASLLogger：支持将调试语句写入到苹果的日志中。一般正对Mac开发。可选。
    //DDTTYLogger：支持将调试语句写入xCode控制台。我们即使要用它。可选。
    //DDFileLogger：支持将调试语句写入到文件系统。可选。
    
    //添加日志输出支持
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];

    /**
     *  控制台颜色需安装xCode扩展插件XcodeColors
     */
    //启用颜色区分
    [[DDTTYLogger sharedInstance] setColorsEnabled:NO];
    //可以修改你想要的颜色
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor blueColor]
                                     backgroundColor:[UIColor grayColor]
                                             forFlag:DDLogFlagInfo];

    DDLogError(@"错误信息");    // 红色
    DDLogWarn(@"警告");        // 橙色
    DDLogInfo(@"提示信息");     // 默认是黑色
    DDLogDebug(@"调试文本");    // 调试文本
    DDLogVerbose(@"详细信息");  // 默认是黑色
    
    /**
     *  监控网络
     */
    [self monitorNetworkSyle];
}

//支持目前所有iOS系统
//-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
//{
//
//    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
//    if (!result)
//    {
//        // 其他如支付等SDK的回调
//
//        if ([url.host isEqualToString:@"safepay"])
//        {
//            //跳转支付宝钱包进行支付，处理支付结果
//            [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
//                NSLog(@"result = %@",resultDic);
//
//                if ([[resultDic objectForKey:@"resultStatus"] isEqualToString:@"9000"])
//                {
//                    NSLog(@"支付成功");
//
//                    [[NSNotificationCenter defaultCenter] postNotificationName:@"alipaySuccess" object:nil];
//
//                }
//                else
//                {
//                    NSLog(@"支付失败");
//                }
//
//            }];
//        }
//        return [WXApi handleOpenURL:url delegate:self];
//    }
//
//    return result;
//
//}

// NOTE: 9.0以后使用新API接口
//-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
//{
//
//    NSString *strUrl = [url absoluteString];
//
//    NSLog(@"当登录进来的时候的url:%@",strUrl);
//
//    if ([strUrl containsString:@"zhixiangyingpin://"])
//    {
//        NSString *strId = [[strUrl componentsSeparatedByString:@"?"].lastObject componentsSeparatedByString:@"="].lastObject;
//        [[NSNotificationCenter defaultCenter] postNotificationName:WEB_TO_APP object:strId];
//    }

    
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
//    BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
//    if (!result)
//    {
//        // 其他如支付等SDK的回调
//
//        if ([url.host isEqualToString:@"safepay"])
//        {
//            //跳转支付宝钱包进行支付，处理支付结果
//            [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
//                NSLog(@"result = %@",resultDic);
//
//                if ([[resultDic objectForKey:@"resultStatus"] isEqualToString:@"9000"])
//                {
//                    NSLog(@"支付成功");
//
//                    [[NSNotificationCenter defaultCenter] postNotificationName:@"alipaySuccess" object:nil];
//
//                }
//                else
//                {
//                    NSLog(@"支付失败");
//                    [[NSNotificationCenter defaultCenter] postNotificationName:@"alipayFail" object:nil];
//                }
//
//            }];
//        }
//
//        return [WXApi handleOpenURL:url delegate:self];
//    }
//    return result;
    
    
//}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    //徽章置零
    [application setApplicationIconBadgeNumber:0];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:APP_NOTICE_ENTER_FORGROUND object:nil userInfo:nil];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"000000000000000000");
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}


#pragma mark -- JPush -----⬇️-------

//注册APNs成功并上报DeviceToken
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@"%@", [NSString stringWithFormat:@"Device Token: %@", deviceToken]);
    
    /// Required - 注册 DeviceToken
//    [JPUSHService registerDeviceToken:deviceToken];

}

//实现注册APNs失败接接口(可选)
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}


// 收到通知

//iOS6及以下系统，收到通知:
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
//    [JPUSHService handleRemoteNotification:userInfo];
    NSLog(@"iOS6及以下系统，收到通知:%@", [self logDic:userInfo]);
    /**
     *  发送通知
     */
    [[NSNotificationCenter defaultCenter] postNotificationName:APP_NOTICE_REMOTE_APNS object:nil userInfo:userInfo];
    
}

//iOS7及以上系统，收到通知:
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    
//    [JPUSHService handleRemoteNotification:userInfo];
    NSLog(@"iOS7及以上系统，收到通知:%@", [self logDic:userInfo]);
    
    if ([[UIDevice currentDevice].systemVersion floatValue]<10.0 || application.applicationState>0)
    {
        /**
         *  发送通知
         */
        [[NSNotificationCenter defaultCenter] postNotificationName:APP_NOTICE_REMOTE_APNS object:nil userInfo:userInfo];
    }
    
    completionHandler(UIBackgroundFetchResultNewData);
}

/**
 *  收到本地推送
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    //[JPUSHService showLocalNotificationAtFront:notification identifierKey:nil];
}


//添加处 APNs通知回调 法

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#pragma mark- JPUSHRegisterDelegate
/**
 *  app在前台时收到远程通知:
 */
//-(void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler
//{
//    NSDictionary * userInfo = notification.request.content.userInfo;
//
//    UNNotificationRequest *request = notification.request;// 收到推送的请求
//    UNNotificationContent *content = request.content;// 收到推送的消息内容
//
//    NSNumber *badge                = content.badge;// 推送消息的角标
//    NSString *body                 = content.body;// 推送消息体
//    UNNotificationSound *sound     = content.sound;// 推送消息的声音
//    NSString *subtitle             = content.subtitle;// 推送消息的副标题
//    NSString *title                = content.title;// 推送消息的标题
//
//    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]])
//    {
//        [JPUSHService handleRemoteNotification:userInfo];
//        NSLog(@"iOS10 前台收到远程通知:%@", [self logDic:userInfo]);
//        NSLog(@"badge :%@", badge );
//        NSLog(@"body:%@", body);
//        NSLog(@"subtitle:%@", subtitle);
//        NSLog(@"title:%@", title);
//        /**
//         *  发送通知
//         */
//        [[NSNotificationCenter defaultCenter] postNotificationName:APP_NOTICE_REMOTE_APNS object:nil userInfo:userInfo];
//    }
//    else
//    {
//        // 判断为本地通知
//        // NSLog(@"iOS10 前台收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}",body,title,subtitle,badge,sound,userInfo);
//    }
//    //功能：可设置是否在应用内弹出通知
//    completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以设置
//}

/**
 *  点击系统通知 时 推送消息后回调
 */
//- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler
//{
//
//    NSDictionary * userInfo = response.notification.request.content.userInfo;
//
//    UNNotificationRequest *request = response.notification.request;// 收到推送的请求
//    UNNotificationContent *content = request.content;// 收到推送的消息内容
//
//    NSNumber *badge                = content.badge;// 推送消息的角标
//    NSString *body                 = content.body;// 推送消息体
//    UNNotificationSound *sound     = content.sound;// 推送消息的声音
//    NSString *subtitle             = content.subtitle;// 推送消息的副标题
//    NSString *title                = content.title;// 推送消息的标题
//
//    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]])
//    {
//        [JPUSHService handleRemoteNotification:userInfo];
//        NSLog(@"iOS10 前台收到远程通知:%@", [self logDic:userInfo]);
//
//        NSLog(@"badge :%@", badge );
//        NSLog(@"body:%@", body);
//        NSLog(@"subtitle:%@", subtitle);
//        NSLog(@"title:%@", title);
//        /**
//         *  发送通知
//         */
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"remote_apns_notification" object:nil userInfo:userInfo];
//
//        //[self remote_apns_notification:userInfo];
//
//    }
//    else
//    {
//        // 判断为本地通知
//        // NSLog(@"iOS10 收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}",body,title,subtitle,badge,sound,userInfo);
//    }
//    completionHandler();  // 系统要求执行这个方法
//}
#endif


// log NSSet with UTF8
// if not ,log will be \Uxxx
- (NSString *)logDic:(NSDictionary *)dic
{
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =

    [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:NULL error:NULL];
    
    return str;
}



#pragma mark -- JPush -----⬆️-------




#pragma mark -- U-Share  -----⬇️-------
//- (void)confitUShareSettings
//{
//    /*
//     * 打开图片水印
//     */
//    //[UMSocialGlobal shareInstance].isUsingWaterMark = YES;
//    
//    /*
//     * 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
//     <key>NSAppTransportSecurity</key>
//     <dict>
//     <key>NSAllowsArbitraryLoads</key>
//     <true/>
//     </dict>
//     */
//    //[UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
//    
//}

//- (void)configUSharePlatforms
//{
//    /* 设置微信的appKey和appSecret */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxdc1e388c3822c80b" appSecret:@"3baf1193c85774b3fd9d18447d76cab0" redirectURL:@"http://mobile.umeng.com/social"];
//    /*
//     * 移除相应平台的分享，如微信收藏
//     */
//    //[[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
//
//    /* 设置分享到QQ互联的appID
//     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
//     */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1105821097"/*设置QQ平台的appID*/  appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
//
//}

#pragma mark -- U-Share  -----⬆️-------

@end











