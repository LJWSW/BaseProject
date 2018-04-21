//
//  NSDictionary+WFZ_Extension.h
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (WFZ_Extension)

/**
 *  取字典指定 key 的 Value
 *
 *  @param aKey key
 *
 *  @return Value   若：nil return @""
 */
- (id)kObjectForKey:(id)aKey;

/**
 *  JSON字符串 转 字典
 *
 *  @param jsonString JSON字符串
 *
 *  @return 字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 *  字典 转 字符串
 *
 *  @param dic 字典
 *
 *  @return JSON字符串
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;


@end
