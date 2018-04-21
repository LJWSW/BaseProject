//
//  NSDictionary+WFZ_Extension.m
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import "NSDictionary+WFZ_Extension.h"

@implementation NSDictionary (WFZ_Extension)
/**
 *  取字典指定 key 的 Value
 *
 *  @param aKey key
 *
 *  @return Value   若：nil return @""
 */
- (id)kObjectForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if (obj) {
        return obj;
    }
    return @"";
}

/**
 *  JSON字符串 转 字典
 *
 *  @param jsonString JSON字符串
 *
 *  @return 字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

/**
 *  字典 转 字符串
 *
 *  @param dic 字典对象
 *
 *  @return 字符串对象
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    
    if (dic == nil) {
        return nil;
    }
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


/**
 *  打印字典 【无序打印】
 *
 *  使用场景：
 *      如果要在开发时，跟踪对象的明细信息，可以重写description方法
 *      如果要在开发时，跟踪数组，字典对象的明细信息，可以重写descriptionWithLocale:方法
 *
 *  @param locale locale description
 *
 *  @return string
 */
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM.copy;
}

@end
