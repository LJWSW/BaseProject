//
//  Methods.h
//  BaseProject
//
//  Created by wufuzeng on 15/12/16.
//  Copyright © 2015年 wufuzeng. All rights reserved.
//  方法宏

#ifndef Methods_h
#define Methods_h


/**
 *  当前对象的若引用
 */
#define WS(_self)  __weak __typeof(&*self)_self = self;
#define WEAKSELF   typeof(self) __weak weakSelf = self;
/**
 *  国际化

 */
#define GUI_TEXT(key) NSLocalizedString(@#key"", nil)

/**
 *  对于curLanguage的值，iOS9在其中增加了地区代码。如简体中文，在iOS9之前为@”zh-Hans”，
 *
 *  [curLanguage isEqualToString:@"zh-Hans"]
 *  在iOS9之后就会有问题，可使用[curLanguage hasPrefix:@"zh-Hans"]来代替。如下：
 */
// 当前语言是否为中文繁体香港
#define isZhHK [[[NSLocale preferredLanguages] firstObject] hasPrefix:@"zh-HK"]
// 当前语言是否为中文繁体
#define isZhHant [[[NSLocale preferredLanguages] firstObject] hasPrefix:@"zh-Hant"]
//  当前语言是否中文简体
#define isZhHans [[[NSLocale preferredLanguages] firstObject] hasPrefix:@"zh-Hans"]

//  当前语言是否为中文
#define APP_ISZh [[[NSLocale preferredLanguages] firstObject] hasPrefix:@"zh"]
//  当前语言是否为英文
#define APP_ISEN [[[NSLocale preferredLanguages] firstObject] hasPrefix:@"en"]

/**
 *  userinfo单例
 */
#define gUserInfo   [UserInfo sharedInstance]

/**
 *  自定义的Bundle文件包：
 */
#define MYBUNDLE_NAME @"MyBundle.bundle"
#define MYBUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: MYBUNDLE_NAME]
#define MYBUNDLE      [NSBundle bundleWithPath: MYBUNDLE_PATH]

/**
 *  获取自定义Bundle文件包中的图片数据
 */
#define BundleImage(bundleName,imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@.bundle/%@",bundleName,imageName]];


/**
 *  获取变量的名字[字符串类型]
 */
#define varString(var) [NSString stringWithFormat:@"%s",#var]

/**
 *  解决Xcode8.0  NSLog 真机打印不全 但是 printf可以打印全
 *  覆盖系统宏 NSLog(format, ...)
 */
#ifdef DEBUG

#define NSLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )

#else

#define NSLog(format, ...)

#endif




#endif /* Methods_h */
