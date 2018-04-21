//
//  NSString+GetFileSize.m
//  CottonYarn
//
//  Created by 蒋旭峰 on 17/8/15.
//  Copyright © 2017年 蒋旭峰. All rights reserved.
//

#import "NSString+GetFileSize.h"

@implementation NSString (GetFileSize)

//计算出大小
+ (NSString *)fileSizeWithInterge:(NSInteger)size
{
    // 1k = 1024, 1m = 1024k
    if (size < 1024) {// 小于1k
        return [NSString stringWithFormat:@"%ldB",(long)size];
    }else if (size < 1024 * 1024){// 小于1m
        CGFloat aFloat = size/1024;
        return [NSString stringWithFormat:@"%.0fK",aFloat];
    }else if (size < 1024 * 1024 * 1024){// 小于1G
        CGFloat aFloat = size/(1024 * 1024);
        return [NSString stringWithFormat:@"%.1fM",aFloat];
    }else{
        CGFloat aFloat = size/(1024*1024*1024);
        return [NSString stringWithFormat:@"%.1fG",aFloat];
    }
}

@end
