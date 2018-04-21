//
//  UIButton+WFZ_Extension.m
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import "UIButton+WFZ_Extension.h"

@implementation UIButton (WFZ_Extension)

/**
 *  创建 UIButton
 *
 *  @param rect              rect
 *  @param title             title
 *  @param titleColor        titleColor
 *  @param imageColor        imageColor
 *  @param clickAction       clickAction
 *  @param viewController    viewController
 *  @param font              font
 *  @param contentEdgeInsets contentEdgeInsets
 *  @param cornerRadius      cornerRadius
 *
 *  @return UIButton
 */
+ (UIButton *)ButtonWithRect:(CGRect)rect
                       title:(NSString *)title
                  titleColor:(UIColor *)titleColor
    BackgroundImageWithColor:(UIColor *)imageColor
                 clickAction:(SEL)clickAction
              viewController:(id)viewController
                   titleFont:(CGFloat)font
           contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets
                cornerRadius:(float)cornerRadius
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame     = rect;
    
    [button setTitle:title
            forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageWithColor:imageColor]
                      forState:UIControlStateNormal];
    
    [button setTitleColor:titleColor
                 forState:UIControlStateNormal];
    
    button.contentEdgeInsets = contentEdgeInsets;
    button.titleLabel.font   = [UIFont systemFontOfSize:font];
    
    if (clickAction)
    {
        [button addTarget:viewController
                   action:clickAction
         forControlEvents:UIControlEventTouchUpInside];
    }
    
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius  = cornerRadius;
    
    return button;
}


@end
