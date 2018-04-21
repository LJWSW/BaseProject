//
//  NSString+valueForKey.h
//  TaizhouPolice
//
//  Created by 蒋旭峰 on 16/11/25.
//  Copyright © 2016年 HYcom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (valueForKey)

+ (NSDictionary *)parametersWithSeparator:(NSString *)separator delimiter:(NSString *)delimiter url:(NSString *)str;

@end
