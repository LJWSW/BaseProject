//
//  NSObject+MJExtension.m
//  BaseProject
//
//  Created by 吴福增 on 2016/12/30.
//  Copyright © 2016年 wufuzeng. All rights reserved.
//

#import "NSObject+WFZ_MJExtension.h"

#import <MJExtension.h>

@implementation NSObject (WFZ_MJExtension)

/** MJExtension是从属性名 -> key */
/*
 如果 key 就是 desc, 那么下方代码自动切换为description则出错
 */
/*
 + (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
 if ([propertyName isEqualToString:@"ID"]) {
 propertyName = @"id";
 }
 if ([propertyName isEqualToString:@"desc"]) {
 propertyName = @"description";
 }
 //    .......
 return propertyName;
 }
 */
+ (id)parse:(id)responseObj{
    
    if ([responseObj isKindOfClass:[NSArray class]])
    {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]])
    {
        return [self mj_objectWithKeyValues:responseObj];
    }
    return [self mj_objectWithKeyValues:responseObj];
}


@end
