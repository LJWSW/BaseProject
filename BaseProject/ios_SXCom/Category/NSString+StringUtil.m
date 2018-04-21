//
//  NSString+StringUtil.m
//  JHWealth
//
//  Created by july on 2017/5/6.
//  Copyright © 2017年 july. All rights reserved.
//

#import "NSString+StringUtil.h"

@implementation NSString (StringUtil)

+ (BOOL)isEmpty:(NSString *)string {
  if (string == nil || string == NULL) {
    return YES;
  }
  if ([string isKindOfClass:[NSNull class]]) {
    return YES;
  }

  if ([string isKindOfClass:[NSString class]] &&
      [[string stringByTrimmingCharactersInSet:[NSCharacterSet
                                                   whitespaceCharacterSet]]
          length] == 0) {
    return YES;
  }
  return NO;
}



@end
