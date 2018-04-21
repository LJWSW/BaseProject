//
//  BaseExtendVC.h
//  ProductDemo
//
//  Created by yixiaoshan on 15/9/21.
//  Copyright (c) 2015年 HYcompany. All rights reserved.
//



#import "BaseVC.h"

#import "AppDelegate.h"

/**
 *  状态栏字体颜色
 */
typedef enum {Black,White} StatusColor;

/**
 *  弹出登录的原因
 */
typedef enum {Login,TokenInvalid} LoginType;


@interface BaseExtendVC : BaseVC

/**
 *  设置当前页面是否可以手势返回
 */
@property (nonatomic, assign) BOOL isNotCanBePop;

/**
 *  statusbar电池信息栏颜色
 */
@property (nonatomic, assign) StatusColor statusColor;

/**
 *  导航栏底部线条
 */
@property (nonatomic, strong) UIView *navLine;


/**
 *  画线条
 */
- (UIView *)getLineWithFrame:(CGRect)frame;

- (CALayer *)getLayerLineWithFrame:(CGRect)frame;

/**
 *  偏好设置的写入/读取
 */
- (void)setUserDefaultWithObj:(id)obj key:(NSString *)key;

- (id)getUserDefaultWittKey:(NSString *)key;

/**
 *  弹出登录
 */
- (void)loginPresentWithLoginType:(LoginType)type previousVCClass:(Class)previousVCClass;


/**
 * 时间戳转换
 */
- (NSString *)timeWithzTimeIntervalString:(long long)timeString;
/**
 *  精确时间，年月日时分秒
 */
- (NSString *)timeWithExactTimeIntervalString:(long long)timeString;

@end

