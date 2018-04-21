//
//  NSObject+WFZ_MJExtension.h
//  BaseProject
//
//  Created by 吴福增 on 2016/12/30.
//  Copyright © 2016年 wufuzeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WFZ_MJExtension)

/*
 MJExtension 解析数组和字典需要使用不同的方法.
 我们自己合并,用代码判断
 */
+ (id)parse:(id)responseObj;



@end
