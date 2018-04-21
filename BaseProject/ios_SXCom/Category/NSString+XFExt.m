//
//  NSString+XFExt.m
//  RedAntExpress
//
//  Created by 蒋旭峰 on 17/7/8.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "NSString+XFExt.h"

@implementation NSString (XFExt)


/**
 *  由NSDate获取日期字符串,yyyy-MM-dd HH:mm:ss
 */
+ (NSString *)getDateStringWithDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    
    return strDate;
}

/**
 *  由NSDate获取日期字符串,自定义日期格式,yyyy-MM-dd HH:mm:ss
 */
+ (NSString *)getDateStringWithDate:(NSDate *)date andFormatter:(NSString *)strFormatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:strFormatter];
    NSString *strDate = [dateFormatter stringFromDate:date];
    
    return strDate;
}

/**
 *  将日期字符串转换为NSDate,yyyy-MM-dd HH:mm:ss
 */
- (NSDate *)stringToDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:self];
    
    return date;
}

/**
 *  将日期字符串转换为NSDate,自定义日期格式,yyyy-MM-dd HH:mm:ss
 */
- (NSDate *)stringToDateWithFormatter:(NSString *)formatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSDate *date = [dateFormatter dateFromString:self];
    
    return date;
}

@end
