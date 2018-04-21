//
//  UserDefaults.m
//  GuanLiBao
//
//  Created by SwiftHorse on 15-1-16.
//  Copyright (c) 2015年 SwiftHorse. All rights reserved.
//

#import "UserDefaults.h"

@implementation UserDefaults

+ (NSString *)getUserDefaultsWithKey:(NSString *)strKey
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *str = [ud objectForKey:strKey];
    
    return str;
}

+ (void)setUserDefaultsWithKey:(NSString *)strKey Value:(NSString *)strValue
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:strValue forKey:strKey];
    
    [ud synchronize];
}

+ (void)removeUserDefaultsWithKey:(NSString *)strKey
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud removeObjectForKey:strKey];
}

@end
