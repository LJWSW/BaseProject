//
//  UIButton+WFZ_Extension.h
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (WFZ_Extension)

/**
 *  创建 UIButton
 *
 *  @param rect              按钮尺寸位置
 *  @param title             文字
 *  @param color             文字颜色
 *  @param imageColor        图片颜色
 *  @param clickAction       响应事件
 *  @param viewController    控制器
 *  @param font              字体大小
 *  @param contentEdgeInsets 内容内边距
 *  @param cornerRadius      圆角
 *
 *  @return UIButton
 */
+ (UIButton *)ButtonWithRect:(CGRect)rect
                       title:(NSString *)title
                  titleColor:(UIColor *)color
    BackgroundImageWithColor:(UIColor *)imageColor
                 clickAction:(SEL)clickAction
              viewController:(id)viewController
                   titleFont:(CGFloat)font contentEdgeInsets:(UIEdgeInsets )contentEdgeInsets
                cornerRadius:(float)cornerRadius;



@end
