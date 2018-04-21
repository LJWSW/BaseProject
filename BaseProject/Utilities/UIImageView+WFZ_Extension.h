//
//  UIImageView+WFZ_Extension.h
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WFZ_Extension)

/**
 *  从父视图中获取 指定的 imageView
 *
 *  @param rect         rect
 *  @param imageName    imageName
 *  @param tag          tag
 *  @param body         父视图对象
 *
 *  @return imageView
 */
+ (UIImageView *)ImageViewWithRect:(CGRect)rect imageName:(NSString *)imageName tag:(int )tag parentId:(id)body;

/**
 *  图片铺满 且 不越界
 */
- (void)fillImage;

/**
 *  配置设圆形图片
 *
 *  @param cornerRadius cornerRadius
 *  @param borderWidth  borderWidth
 *  @param borderColor  borderColor
 */
- (void)setupCircleCornerRadius:(CGFloat )cornerRadius
                    borderWidth:(CGFloat)borderWidth
                    borderColor:(UIColor*)borderColor;

/**
 *  改变图片颜色
 *
 *  @param color color
 *  @param image image
 *
 *  @return image
 */
- (UIImage *)imageWithColor:(UIColor *)color image:(UIImage *)image;


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
 *  压缩图片到小于一定值kb
 *
 *  @param length KB
 *
 *  @return img
 */
-(NSData*)compressionPictureLessThanLength:(NSInteger)length;

/**
 *  手动实现图片压缩，可以写到分类里，封装成常用方法。按照大小进行比例压缩，改变了图片的size。
 */
- (UIImage *)makeThumbnailFromImage:(UIImage *)srcImage scale:(double)imageScale;

/**
 *  解决方向
 */
+ (UIImage *)fixOrientation:(UIImage *)aImage;


@end
