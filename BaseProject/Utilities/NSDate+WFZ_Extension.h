//
//  NSDate+WFZ_Extension.h
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WFZ_Extension)

/**
 *  时间显示格式
 *
 *  @param string string //@"yyyy-MM-dd hh:mm:ss"  ...
 *
 *  @return date
 */
+ (NSDate *)FromString:(NSString *)string;

#pragma --mark-- ⬇️ -- 日期字符串 <-> 时间戳 ----

/**
 *  时间戳转日期字符串
 *
 *  @param timeInterval 时间戳 单位ms（毫秒） 1s = 10000ms
 *
 *  @return  yyyy-MM-dd
 */
+ (NSString *)dateStingWithTimeintval:(NSTimeInterval)timeInterval;


/**
 *  时间戳转日期字符串
 *
 *  @param timeInterval 时间戳 单位ms（毫秒） 1s = 10000ms
 *  @param style        自定义返回格式 如@"yyyy年MM月dd日 "/@"yyyy年MM月dd日 HH:mm:ss"
 *
 *  @return  自定义返回格式的Str
 */

+ (NSString *)dateStingWithTimeintval:(NSTimeInterval)timeInterval andStyle:(NSString *)style;

/**
 *  日期字符串 转 时间戳
 *
 *  @param string 默认样式:@"2014-01-23";
 *
 *  @return 时间戳
 */
+ (NSTimeInterval)timeIntervalWithString:(NSString *)string;


/**
 *  日期字符串 转 时间戳
 *
 *  @param string 默认样式:@"2014-01-23";
 *  @param style  自定义返回格式 如@"yyyy年MM月dd日 "/@"yyyy年MM月dd日 HH:mm:ss"
 *
 *  @return 时间戳
 */
+ (NSTimeInterval)timeIntervalWithString:(NSString *)string andStyle:(NSString *)style;

#pragma --mark-- ⬆️ -- 日期字符串 <-> 时间戳 ----



/**
 *  计算年份差的年龄
 *
 *  @param birthStr 生日  //birthStr = @"1993-10-30"
 *
 *  @return 年龄
 */
-(NSString*)calculateAgeFromBirthStr:(NSString*)birthStr;

@end
