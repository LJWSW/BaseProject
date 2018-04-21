//
//  NSObject+WFZ_MBProgressHUD.m
//  BaseProject
//
//  Created by 吴福增 on 2016/12/30.
//  Copyright © 2016年 wufuzeng. All rights reserved.
//

#import "NSObject+WFZ_MBProgressHUD.h"

@implementation NSObject (WFZ_MBProgressHUD)


/**
 *  弹出提示框
 *
 *  @param title   title
 *  @param message message
 *  @param view    view //nil 则为屏幕顶层view
 */
+ (void)showHUDWithTitle:(NSString *)title Message:(NSString*)message toView:(UIView*)view
{
    
    if (view == nil)
    {
        view = [UIViewController lastWindow];
    }
    
    //防止在非主线程中调用此方法,会报错
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //弹出新的提示之前,先把旧的隐藏掉
        
        [MBProgressHUD hideAllHUDsForView:view animated:YES];
//        MBProgressHUD 
        
        MBProgressHUD *hud   = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.mode             = MBProgressHUDModeText;
        hud.labelText        = title;
        hud.detailsLabelText = message;
        hud.dimBackground    = YES;// YES代表需要蒙版效果
        hud.removeFromSuperViewOnHide = YES;
       
        [hud hide:YES afterDelay:1.5];
        
        
    });
}

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)success
{
    [self showHUDWithTitle:success Message:nil iconImage:[UIImage imageNamed:@"success"] toView:nil];
}

/**
 *  显示错误信息
 */
+ (void)showError:(NSString *)error
{
    [self showHUDWithTitle:error Message:nil iconImage:[UIImage imageNamed:@"error"] toView:nil];
}


/**
 *  显示 信息 图片
 *
 *  @param title     title description
 *  @param message   message description
 *  @param iconImage iconImage description
 *  @param view      view description
 */
+ (void)showHUDWithTitle:(NSString *)title Message:(NSString*)message iconImage:(UIImage *)iconImage toView:(UIView*)view
{
    
    if (view == nil)
    {
        view = [UIViewController lastWindow];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        // 快速显示一个提示信息
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.labelText      = title;
        hud.detailsLabelText = message;
        hud.customView     = [[UIImageView alloc] initWithImage:iconImage];
        hud.mode           = MBProgressHUDModeCustomView;
        
        hud.removeFromSuperViewOnHide = YES;
        hud.dimBackground = YES;
        // 1秒之后再消失
        [hud hide:YES afterDelay:1.2];
    });
}



/**
 *  自定义视图弹窗
 *
 *  @param customView      customView description
 *  @param backgroundColor 蒙版颜色
 *  @param color           弹窗颜色
 *  @param view            view description
 */
+ (void)showHUDWithCustomView:(UIView*)customView backgroundColor:(UIColor*)backgroundColor color:(UIColor*)color
{
    
//    if (view == nil)
//    {
//        view = [UIViewController lastWindow];
//    }
    dispatch_async(dispatch_get_main_queue(), ^{
        // 快速显示一个提示信息
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo: [UIViewController lastWindow] animated:YES];

        hud.backgroundColor = backgroundColor;
        hud.color = color;
        hud.customView     = customView;
        hud.mode           = MBProgressHUDModeCustomView;
        
        hud.removeFromSuperViewOnHide = YES;
        hud.dimBackground = YES;
        // 1秒之后再消失
        //        [hud hide:YES afterDelay:1.2];
    });
}


/**
 *  显示忙
 */
+ (void)showBusy:(NSString *)busy
{
   
    dispatch_async(dispatch_get_main_queue(), ^{
        
        AppDelegate* app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        
        [MBProgressHUD hideAllHUDsForView:app.window animated:YES];
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:app.window animated:YES];
        hud.labelText                 = busy;
        hud.removeFromSuperViewOnHide = YES;
        hud.dimBackground             = NO;
        //最长显示30秒
        [hud hide:YES afterDelay:10];
        
    });
    
}

/**
 *  隐藏提示
 */
+ (void)hideProgress
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        AppDelegate* app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        
        [MBProgressHUD hideAllHUDsForView:app.window animated:YES];
    });
    
}






















@end
