//
//  UserDefaults.h
//  GuanLiBao
//
//  Created by SwiftHorse on 15-1-16.
//  Copyright (c) 2015年 SwiftHorse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaults : NSObject

/**
 *  获取缓存
 *
 *  @param strKey 缓存关键字
 *
 *  @return 缓存数据
 */
+ (NSString *)getUserDefaultsWithKey:(NSString *)strKey;

/**
 *  写入缓存
 *
 *  @param strKey   缓存关键字
 *  @param strValue 缓存数据
 */
+ (void)setUserDefaultsWithKey:(NSString *)strKey Value:(NSString *)strValue;

/**
 *  清楚缓存
 *
 *  @param strKey 缓存关键字
 */
+ (void)removeUserDefaultsWithKey:(NSString *)strKey;

@end
