//
//  NSMutableDictionary+WFZ_Extension.h
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (WFZ_Extension)

/**
 *  字典 给指定 key 赋值
 *
 *  @param obj 值  若：nil 自动 用@"" 替代
 *  @param key key
 */
- (void)kSetObject:(id)obj forKey:(id)key;


@end
