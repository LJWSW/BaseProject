//
//  UIImage+RTTint.h
//
//  Created by Ramon Torres on 7/3/13.
//  Copyright (c) 2013 Ramon Torres <raymondjavaxx@gmail.com>. All rights reserved.
//


/**
 *   调整 图片 色调 
 *
 *   亮度： 色调白色
 *   暗度： 色调黑色
 */

#import <UIKit/UIKit.h>

@interface UIImage (RTTint)

/**
 *  为图片添加色调
 *
 *  @param color 颜色
 *  @param rect  图片区域
 *  @param level 色阶 // 色彩等级 0~1
 *
 *  @return image
 */
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color;
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color level:(CGFloat)level;
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color rect:(CGRect)rect;
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color rect:(CGRect)rect level:(CGFloat)level;


/**
 *  为图片添加色调
 *
 *  @param color  颜色
 *  @param insets 嵌入区域
 *  @param level  色阶 // 色彩等级 0~1
 *
 *  @return image
 */
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color insets:(UIEdgeInsets)insets;
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color insets:(UIEdgeInsets)insets level:(CGFloat)level;


/**
 *  为图片增加亮度
 *
 *  @param level 色阶 // 色彩等级 0~1  1时：全白 0时：原图效果
 *  @param insets 嵌入区域
 *  @param rect  图片区域
 *
 *  @return image
 */
-(UIImage*)rt_lightenWithLevel:(CGFloat)level;
-(UIImage*)rt_lightenWithLevel:(CGFloat)level insets:(UIEdgeInsets)insets;
-(UIImage*)rt_lightenRect:(CGRect)rect withLevel:(CGFloat)level;

/**
 *  为图片增加暗度
 *
 *  @param level 色阶 // 色彩等级 0~1  1时：全黑 0时：原图效果
 *  @param insets 嵌入区域
 *  @param rect  图片区域
 *
 *  @return image
 */
-(UIImage*)rt_darkenWithLevel:(CGFloat)level;
-(UIImage*)rt_darkenWithLevel:(CGFloat)level insets:(UIEdgeInsets)insets;
-(UIImage*)rt_darkenRect:(CGRect)rect withLevel:(CGFloat)level;

@end
