//
//  NSObject+WFZ_MBProgressHUD.h
//  BaseProject
//
//  Created by 吴福增 on 2016/12/30.
//  Copyright © 2016年 wufuzeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MBProgressHUD.h>

@interface NSObject (WFZ_MBProgressHUD)


/**
 *  弹出提示框
 *
 *  @param title   title
 *  @param message message
 *  @param view    view //nil 则为屏幕顶层view
 */
+ (void)showHUDWithTitle:(NSString *)title Message:(NSString*)message toView:(UIView*)view;

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)success;
/**
 *  显示错误信息
 */
+ (void)showError:(NSString *)error;


/**
 *  显示 信息 图片
 *
 *  @param title     title description
 *  @param message   message description
 *  @param iconImage iconImage description
 *  @param view      view description
 */
+ (void)showHUDWithTitle:(NSString *)title Message:(NSString*)message iconImage:(UIImage *)iconImage toView:(UIView*)view;

/**
 *  自定义视图弹窗
 *
 *  @param customView      customView description
 *  @param backgroundColor 蒙版颜色
 *  @param color           弹窗颜色
 *  @param view            view description
 */
+ (void)showHUDWithCustomView:(UIView*)customView backgroundColor:(UIColor*)backgroundColor color:(UIColor*)color;

/**
 *  显示忙
 */
+ (void)showBusy:(NSString *)busy;
/**
 *  隐藏提示
 */
+ (void)hideProgress;


@end
