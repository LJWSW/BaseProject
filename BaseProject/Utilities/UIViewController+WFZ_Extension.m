//
//  UIViewController+WFZ_Extension.m
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import "UIViewController+WFZ_Extension.h"

@implementation UIViewController (WFZ_Extension)

/**
 *  获取当前屏幕的最上方正在显示的那个View
 */
+(UIView *)currentTopView
{
    return [UIViewController currentTopViewController].view;
}

/**
 *  获取当前屏幕的最上方正在显示的那个VC
 */
+(UIViewController *)currentTopViewController
{
    UIViewController *vc=[UIApplication sharedApplication].keyWindow.rootViewController;
    // vc: 导航控制器, 标签控制器, 普通控制器
    if ([vc isKindOfClass:[UITabBarController class]])
    {
        vc = [(UITabBarController *)vc selectedViewController];
    }
    
    if ([vc isKindOfClass:[UINavigationController class]])
    {
        vc = [(UINavigationController *)vc visibleViewController];
    }
    
    return vc;
}
/**
 *  最上层的Window
 */
+ (UIWindow *)lastWindow
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for(UIWindow *window in [windows reverseObjectEnumerator])
    {
        if ([window isKindOfClass:[UIWindow class]] &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds)
            )
            
            return window;
    }
    
    return [UIApplication sharedApplication].keyWindow;
}


@end
