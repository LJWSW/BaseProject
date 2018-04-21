//
//  NSString+valueForKey.m
//  TaizhouPolice
//
//  Created by 蒋旭峰 on 16/11/25.
//  Copyright © 2016年 HYcom. All rights reserved.
//

#import "NSString+valueForKey.h"

@implementation NSString (valueForKey)

+ (NSDictionary *)parametersWithSeparator:(NSString *)separator delimiter:(NSString *)delimiter url:(NSString *)str{

    NSArray *parameterPairs =[str componentsSeparatedByString:delimiter];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:[parameterPairs count]];
    for (NSString *currentPair in parameterPairs) {
        NSRange range = [currentPair rangeOfString:separator];
        if(range.location == NSNotFound)
            continue;
        NSString *key = [currentPair substringToIndex:range.location];
        NSString *value =[currentPair substringFromIndex:range.location + 1];
        [parameters setObject:value forKey:key];
    }
    return parameters;
}

@end
