//
//  UIImage+CutSize.h
//  NewMileCar
//
//  Created by 蒋旭峰 on 16/12/14.
//  Copyright © 2016年 蒋旭峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CutSize)

- (UIImage *)cutWithSize:(CGSize)size;

+ (instancetype)fixOrientation:(UIImage *)image;

@end
