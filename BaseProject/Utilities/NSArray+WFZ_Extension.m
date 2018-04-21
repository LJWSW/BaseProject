//
//  NSArray+WFZ_Extension.m
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import "NSArray+WFZ_Extension.h"

@implementation NSArray (WFZ_Extension)

/**
 *  JSON字符串 转 数组
 *
 *  @param jsonString JSON字符串
 *
 *  @return 数组
 */
+ (NSArray *)arrWithJsonString:(NSString *)jsonString{
    
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSArray *arr     = [NSJSONSerialization JSONObjectWithData:jsonData
                                                       options:NSJSONReadingMutableContainers
                                                         error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return arr;
}

/**
 *  数组 转 JSON字符串
 *
 *  @param dic 数组
 *
 *  @return JSON字符串
 */
+ (NSString*)arrToJson:(NSArray *)dic{
    
    NSError *parseError = nil;
    NSData *jsonData    = [NSJSONSerialization dataWithJSONObject:dic
                                                          options:NSJSONWritingPrettyPrinted
                                                            error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}



/**
 *  打印数组 【无序打印】
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
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    
    [strM appendString:@")"];
    
    return strM.copy;
}


@end
