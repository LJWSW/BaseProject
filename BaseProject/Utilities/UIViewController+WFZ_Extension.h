//
//  UIViewController+WFZ_Extension.h
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (WFZ_Extension)

/**
 *  获取当前屏幕的最上方正在显示的那个View
 */
+(UIView *)currentTopView;

/**
 *  获取当前屏幕的最上方正在显示的那个VC
 */
+(UIViewController *)currentTopViewController;

/**
 *  最上层的Window
 */
+ (UIWindow *)lastWindow;


@end
