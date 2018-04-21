//
//  NSString+FloatToStr.m
//  CottonYarn
//
//  Created by 蒋旭峰 on 2017/8/5.
//  Copyright © 2017年 蒋旭峰. All rights reserved.
//

#import "NSString+FloatToStr.h"

@implementation NSString (FloatToStr)

//浮点数处理并去掉多余的0
+ (NSString *)stringDisposeWithFloat:(float)floatValue
{
    NSString *str = [NSString stringWithFormat:@"%f",floatValue];
    long len = str.length;
    for (int i = 0; i < len; i++)
    {
        if (![str  hasSuffix:@"0"])
            break;
        else
            str = [str substringToIndex:[str length]-1];
    }
    if ([str hasSuffix:@"."])//避免像2.0000这样的被解析成2.
    {
        //s.substring(0, len - i - 1);
        return [str substringToIndex:[str length]-1];
    }
    else
    {
        return str;
    }
}

@end
