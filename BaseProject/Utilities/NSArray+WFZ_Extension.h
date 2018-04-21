//
//  NSArray+WFZ_Extension.h
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (WFZ_Extension)

/**
 *  JSON字符串 转 数组
 *
 *  @param jsonString JSON字符串
 *
 *  @return 数组
 */
+ (NSArray *)arrWithJsonString:(NSString *)jsonString;

/**
 *  数组 转 JSON字符串
 *
 *  @param dic 数组
 *
 *  @return JSON字符串
 */
+ (NSString*)arrToJson:(NSArray *)dic;

@end
