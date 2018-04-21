//
//  Constants.h
//  HealthStore
//
//  Created by 楼某人 on 2018/1/24.
//  Copyright © 2018年 楼某人. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

/**
 *  APP的主要颜色
 */
#define APP_MAIN_COLOR        UIColorFromRGBA(196, 166, 106, 1.0)

/**
 *  iPhoneX 适配
 */
#define SafeAreaTopHeight (G_SCREEN_HEIGHT == 812.0 ? 88 : 64)

#define SafeAreaToTopHeight (G_SCREEN_HEIGHT == 812.0 ? 24 : 0)

#define SafeAreaBottomHeight (G_SCREEN_HEIGHT == 812.0 ? 82 : 48)

#define SafeAreaToBottomHeight (G_SCREEN_HEIGHT == 812.0 ? 34 : 0)

//是否为iOS8及以上系统 （10.0+ 获得的是1）
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)

//当前设备系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

/**
 *  获取屏幕 宽度、高度
 */
#define G_SCREEN_WIDTH             [UIScreen mainScreen].bounds.size.width
#define G_SCREEN_HEIGHT            [UIScreen mainScreen].bounds.size.height
#define G_SCREEN_WIDTHSCALE        G_SCREEN_WIDTH/750              //屏幕宽对比750的比例
//#define APP_NAVI_BAR_HEIGHT        64

/**
 *  字体大小
 */
#define APP_NAVI_BAR_FONT         [UIFont boldSystemFontOfSize:16]
#define APP_BOLD_FONT(size)       [UIFont boldSystemFontOfSize:G_SCREEN_WIDTHSCALE * size]
#define G_FONT(size)              [UIFont systemFontOfSize:G_SCREEN_WIDTHSCALE * size]

// 主题色
#define APP_THEME_COLOR       UIColorFromHEXA(0xf55688,1.0) //#f55688 //UIColorFromRGBA(247, 160, 208, 1.0)
#define APP_TITLE_COLOR       UIColorFromRGBA(0, 0, 0, 1.0)
#define APP_SUBTITLE_COLOR    UIColorFromRGBA(175, 175, 175, 1.0)

// 颜色分档 深 --> 浅
#define APP_TITLE_COLOR_1    UIColorFromRGBA(37, 37, 37, 1.0)
#define APP_TITLE_COLOR_2    UIColorFromRGBA(59, 59, 59, 1.0)
#define APP_TITLE_COLOR_3    UIColorFromRGBA(114, 114, 114, 1.0)
#define APP_TITLE_COLOR_4    UIColorFromRGBA(125, 125, 125, 1.0)
#define APP_TITLE_COLOR_5    UIColorFromRGBA(188, 188, 188, 1.0)

//#define APP_INFO_COLOR        UIColorFromRGB(194, 194, 194)

#define APP_LINE_COLOR        UIColorFromRGBA(218, 218, 221, 1.0)
//气泡框色
//#define APP_POP_COLOR         UIColorFromRGBA(52, 52, 52, 1.0)
//蒙版色
//#define APP_SHADOW_COLOR      UIColorFromRGBA(0, 0, 0, 0.4)

//粉红
//#define APP_PINK_COLOR        UIColorFromRGB(250, 118, 123)
//红
//#define APP_RED_COLOR         UIColorFromRGB(237, 0, 0)
//绿
//#define APP_GREEN_COLOR       UIColorFromRGB(70, 181, 45)
//紫
//#define APP_PURPLE_COLOR      UIColorFromRGB(124, 108, 174)
//
//蓝
//#define APP_BLUE_COLOR        UIColorFromRGB(156, 201, 234)

/**
 *  文字颜色
 */
#define G_TEXT_COLOR    RGBCOLOR(51, 51, 51)

/**
 * 系统线条颜色
 */
#define G_SYSTEMLINE_COLOR  RGBCOLOR(209, 208, 213)

/**
 *主题色
 **/
#define G_THEME_COLOR  RGBCOLOR(71, 145, 240)

/**
 *  颜色函数缩写
 */
#define RGBCOLOR(r,g,b)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


/// 归档cookie 时的 key
#define kUserDefaultsCookie @"surfLifeCookie"

#define G_IS_LOGIN  @"gIsLogin"

/**
 *  第三方 Key
 */
// 苹果商店中你APP的ID
//#define kAppleID @" "

/// 极光推送 appKey
#define kJPushKey @"7a96d023b0cc1cfe0abdf399"

/// 友盟+ appkey
#define kUMKey @"5947667d4ad15615920009e0"

/// 微信 appleid/secret
#define WXKey @"wx2e4e4791ccc078c9"
#define WXSecret @""

/// 的QQ appkey
#define G_QQAppleId @"1106159065"
#define G_QQSecret @"ln2Boabnhwrbx9rp"

/// appStore中的下载地址
//#define DownloadURL @"https://itunes.apple.com/cn/app/zhi-xiang-ying-pin/id1334474067?mt=8"


#endif /* Constants_h */
