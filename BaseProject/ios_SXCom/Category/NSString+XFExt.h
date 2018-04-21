//
//  NSString+XFExt.h
//  RedAntExpress
//
//  Created by 蒋旭峰 on 17/7/8.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XFExt)

/**
 *  由NSDate获取日期字符串,yyyy-MM-dd HH:mm:ss
 */
+ (NSString *)getDateStringWithDate:(NSDate *)date;

/**
 *  由NSDate获取日期字符串,自定义日期格式,yyyy-MM-dd HH:mm:ss
 */
+ (NSString *)getDateStringWithDate:(NSDate *)date andFormatter:(NSString *)strFormatter;

/**
 *  将日期字符串转换为NSDate,yyyy-MM-dd HH:mm:ss
 */
- (NSDate *)stringToDate;

/**
 *  将日期字符串转换为NSDate,自定义日期格式,yyyy-MM-dd HH:mm:ss
 */
- (NSDate *)stringToDateWithFormatter:(NSString *)formatter;



@end
