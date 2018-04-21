//
//  NSString+WFZ_Extension.h
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WFZ_Extension)


#pragma --mark-- ⬇️ -- ----


/**
 *  判断内容是否全部为空格
 */
+ (BOOL)isEmpty:(NSString *)str;


/**
 *  判断字符串是否不为空 包括(' ',nil,null)
 *
 *  @return 如果不是(' ',nil,null)返回YES
 */
-(BOOL)isNotNilString;

#pragma --mark-- ⬆️ -- ----


#pragma --mark-- ⬇️ -- 计算字符串绘制矩形区域大小 ----

/**
 *  计算字符串绘制矩形区域
 *
 *  @param font    字体大小
 *  @param maxSize maxSize // with,height 为0 表示 无穷大
 *
 *  @return size
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  返回指定显示宽度和字体后字符串 需要 显示的高度
 *
 *
 */

-(CGFloat)heightWithWidth:(CGFloat)width font:(CGFloat)font;

#pragma --mark-- ⬆️ -- 计算字符串绘制矩形区域大小 ----





#pragma --mark-- ⬇️ -- 计算两个地理位置距离 ----

/**
 *  计算两个地理位置距离 [参数为浮点类型]
 *
 *  @param lat1 地点1维度
 *  @param lng1 地点1经度
 *  @param lat2 地点2维度
 *  @param lng2 地点2经度
 *
 *  @return 保留1位小数的距离字符串
 */
+(NSString*)distanceBetweenOrderBylat1:(double)lat1
                                  lng1:(double)lng1
                                  lat2:(double)lat2
                                  lng2:(double)lng2;

/**
 *  计算两个地理位置距离  [参数为字符串类型]
 *
 *  @param lat1Str 地点1维度
 *  @param lng1Str 地点1经度
 *  @param lat2Str 地点2维度
 *  @param lng2Str 地点2经度
 *
 *  @return 保留1位小数的距离字符串
 */
+(NSString*)distanceBetweenOrderBylat1Str:(NSString*)lat1
                                  lng1Str:(NSString*)lng1
                                  lat2Str:(NSString*)lat2
                                  lng2Str:(NSString*)lng2;

#pragma --mark-- ⬆️ -- 计算两个地理位置距离 ----





#pragma --mark-- ⬇️ -- ----

+ ( NSMutableAttributedString * )HTMLFromString:(NSString *)string;


#pragma --mark-- ⬆️ -- ----


/**
 *  隐藏手机号码中间字符
 */
+(NSString*)hiddenPhoneNoMiddleWithStr:(NSString*)str;

/**
 *  隐藏邮箱中间字符
 */
+(NSString*)hiddenEmailMiddleWithStr:(NSString*)str;

/**
 *  生成中划线符文本字符串
 */
+(NSMutableAttributedString*)createDeleteSyleStrWithStr:(NSString*)str font:(UIFont*)font textColor:(UIColor*)color;

/**
 *  生成中划线符文本字符串
 */
+(NSMutableAttributedString*)createDeleteSyleStrWithStr:(NSString*)str font:(UIFont*)font textColor:(UIColor*)color deleteLineRange:(NSRange)range;

@end
