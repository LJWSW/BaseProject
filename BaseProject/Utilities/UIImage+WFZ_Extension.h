//
//  UIImage+WFZ_Extension.h
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WFZ_Extension)

/**
 *  颜色 转 图片 【纯色图片】
 *
 *  @param color color
 *
 *  @return image
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 *	根据颜色生成带圆角的图片
 *
 *	@param color			待生成的图片颜色
 *	@param targetSize		生成的大小
 *	@param cornerRadius		圆角大小
 *	@param backgroundColor 当有圆角大小时，才需要到此参数。用于设置被裁剪的圆角部分的颜色。
 *
 *	@return 带圆角的图片对象
 */
+ (UIImage *)hyb_imageWithColor:(UIColor *)color
                         toSize:(CGSize)targetSize
                   cornerRadius:(CGFloat)cornerRadius
                backgroundColor:(UIColor *)backgroundColor;


/**
 *  生成缩略图
 *
 *  @param image 原图
 *  @param size  大小范围
 *
 *  @return 新的图片
 */
+(UIImage*)thumbnailWithImage:(UIImage *)image size:(CGSize)size;


/**
 *  解决方向
 */
+ (UIImage *)fixOrientation:(UIImage *)aImage;


@end
