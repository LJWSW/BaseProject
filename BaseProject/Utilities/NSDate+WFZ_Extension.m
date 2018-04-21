//
//  NSDate+WFZ_Extension.m
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import "NSDate+WFZ_Extension.h"

@implementation NSDate (WFZ_Extension)



/**
 *  时间显示格式
 *
 *  @param string string //@"yyyy-MM-dd hh:mm:ss"  ...
 *
 *  @return date
 */
+ (NSDate *)FromString:(NSString *)string
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date=[formatter dateFromString:string];
    return date;
}


#pragma --mark-- ⬇️ -- 日期字符串 <-> 时间戳 ----
/**
 *  时间戳转日期字符串
 *
 *  @param timeInterval 时间戳 单位ms（毫秒） 1s = 10000ms
 *
 *  @return  yyyy-MM-dd
 */
+ (NSString *)dateStingWithTimeintval:(NSTimeInterval)timeInterval
{
    return [self dateStingWithTimeintval:timeInterval andStyle:@"yyyy-MM-dd"];
}

/**
 *  时间戳转日期字符串
 *
 *  @param timeInterval 时间戳 单位ms（毫秒） 1s = 10000ms
 *  @param style        自定义返回格式 如@"yyyy年MM月dd日 "/@"yyyy年MM月dd日 HH:mm:ss"
 *
 *  @return  自定义返回格式的Str
 */
+ (NSString *)dateStingWithTimeintval:(NSTimeInterval)timeInterval andStyle:(NSString *)style
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval/1000];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:style];
    NSString *time = [dateFormatter stringFromDate:date];
    
    return [NSString stringWithFormat:@"%@",time];
}

/**
 *  日期字符串 转 时间戳
 *
 *  @param string 默认样式:@"2014-01-23";
 *
 *  @return 时间戳
 */

+ (NSTimeInterval)timeIntervalWithString:(NSString *)string
{
    return [self timeIntervalWithString:string andStyle:@"yyyy-MM-dd"];
}

/**
 *  日期字符串 转 时间戳
 *
 *  @param string 默认样式:@"2014-01-23";
 *  @param style  自定义返回格式 如@"yyyy年MM月dd日 "/@"yyyy年MM月dd日 HH:mm:ss"
 *
 *  @return 时间戳
 */

+ (NSTimeInterval)timeIntervalWithString:(NSString *)string andStyle:(NSString *)style
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:style];
    NSDate *date = [dateFormatter dateFromString:string];
    return date.timeIntervalSince1970 * 1000;
}

#pragma --mark-- ⬆️ -- 日期字符串 <-> 时间戳 ----


/**
 *  计算年份差的年龄
 *
 *  @param birthStr 生日  //birthStr = @"1993-10-30"
 *
 *  @return 年龄
 */
-(NSString*)calculateAgeFromBirthStr:(NSString*)birthStr{
    
    //    if (!birthStr)
    //    {
    //        return @"0";
    //    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //生日
    NSDate *birthDay = [dateFormatter dateFromString:birthStr];
    //当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    NSDate *currentDate = [dateFormatter dateFromString:currentDateStr];
    
    
    NSTimeInterval time=[currentDate timeIntervalSinceDate:birthDay];
    int age = ((int)time)/(3600*24*365);
    
    return [NSString stringWithFormat:@"%d",age];
    
    //    NSLog(@"currentDate %@ birthDay %@",currentDateStr,birthStr);
    //    NSLog(@"year %d",age);
    
}




@end
