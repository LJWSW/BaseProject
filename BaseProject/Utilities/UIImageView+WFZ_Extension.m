//
//  UIImageView+WFZ_Extension.m
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import "UIImageView+WFZ_Extension.h"

@implementation UIImageView (WFZ_Extension)


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
+ (UIImageView *)ImageViewWithRect:(CGRect)rect
                         imageName:(NSString *)imageName
                               tag:(int)tag
                          parentId:(id)body
{
    UIImageView *img = (UIImageView *)[body viewWithTag:tag];
    if (!img)
    {
        img        = [[UIImageView alloc]initWithFrame:rect];
        img.image  = [UIImage imageNamed:imageName];
        img.tag    = tag;
    }
    else
    {
        img.image = [UIImage imageNamed:imageName];
        img.tag   = tag;
        img.frame = rect;
    }
    
    return img;
}

/**
 *  图片铺满 且 不越界
 */
- (void)fillImage
{
    self.contentMode   = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;
}

/**
 *  配置设圆形图片
 *
 *  @param cornerRadius cornerRadius
 *  @param borderWidth  borderWidth
 *  @param borderColor  borderColor
 */
- (void)setupCircleCornerRadius:(CGFloat )cornerRadius
                    borderWidth:(CGFloat)borderWidth
                    borderColor:(UIColor*)borderColor
{
    self.layer.cornerRadius  = cornerRadius;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth   = borderWidth;
    self.layer.borderColor   = borderColor.CGColor;
}



/**
 *  改变图片颜色
 *
 *  @param color color
 *  @param image image
 *
 *  @return image
 */
- (UIImage *)imageWithColor:(UIColor *)color image:(UIImage *)image
{
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO,2);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.frame.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    CGImageRef cgimage = image.CGImage;
    CGContextClipToMask(context, rect,cgimage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


/**
 *	根据颜色生成带圆角的图片
 *
 *	@param color			待生成的图片颜色
 *	@param targetSize		生成的大小
 *	@param cornerRadius		圆角大小
 *	@param backgroundColor  当有圆角大小时，才需要到此参数。用于设置被裁剪的圆角部分的颜色。
 *
 *	@return 带圆角的图片对象
 */
+ (UIImage *)hyb_imageWithColor:(UIColor *)color
                         toSize:(CGSize)targetSize
                   cornerRadius:(CGFloat)cornerRadius
                backgroundColor:(UIColor *)backgroundColor
{
    UIGraphicsBeginImageContextWithOptions(targetSize, YES, [UIScreen mainScreen].scale);
    
    CGRect targetRect = (CGRect){0, 0, targetSize.width, targetSize.height};
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, targetRect);
    
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (cornerRadius != 0) {
        UIGraphicsBeginImageContextWithOptions(targetSize, YES, [UIScreen mainScreen].scale);
        
        if (backgroundColor) {
            [backgroundColor setFill];
            CGContextFillRect(UIGraphicsGetCurrentContext(), targetRect);
        }
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:targetRect
                                                   byRoundingCorners:UIRectCornerAllCorners
                                                         cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        CGContextAddPath(UIGraphicsGetCurrentContext(), path.CGPath);
        CGContextClip(UIGraphicsGetCurrentContext());
        [finalImage drawInRect:targetRect];
        finalImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    return finalImage;
}


/**
 *  生成缩略图
 *
 *  @param image 原图
 *  @param size  大小范围
 *
 *  @return 新的图片
 */
+(UIImage*)thumbnailWithImage:(UIImage *)image size:(CGSize)size
{
    UIImage *newImage = nil;
    
    if (nil == image)
    {
        newImage = nil;
    }
    else
    {
        UIGraphicsBeginImageContext(size);
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return  newImage;
}

/**
 *  压缩图片内容，不影响图片的size，得到一个原大小，但更模糊的图片。但是再用imageWithData: 大小又还原了
 *
 *  压缩图片到小于一定值kb
 *
 *  @param length KB
 *
 *  @return img
 */
-(NSData*)compressionPictureLessThanLength:(NSInteger)length
{
    NSData *imageData     = UIImageJPEGRepresentation(self, 1);
    NSInteger imageLength = [imageData length]/1000;//kb  结果是kb的，但是和真正的大小差了几kb
    
    UIImage* imageNew     = self;
    
    while (imageLength >= length)
    {
        NSLog(@"fileData 长度:%ld",imageLength);
        
        imageData   = UIImageJPEGRepresentation(imageNew, 0.9);
        imageLength = [imageData length]/1000;//kb
        
        imageNew    = [UIImage imageWithData:imageData];
        
    }
    
    NSLog(@"imageData 长度:%ld",imageData.length/1000);
    
    //return imageNew;
    return imageData;
}






/**
 *  手动实现图片压缩，可以写到分类里，封装成常用方法。按照大小进行比例压缩，改变了图片的size。
 */
- (UIImage *)makeThumbnailFromImage:(UIImage *)srcImage scale:(double)imageScale
{
    UIImage *thumbnail = nil;
    CGSize imageSize = CGSizeMake(srcImage.size.width * imageScale, srcImage.size.height * imageScale);
    if (srcImage.size.width != imageSize.width || srcImage.size.height != imageSize.height)
    {
        UIGraphicsBeginImageContext(imageSize);
        CGRect imageRect = CGRectMake(0.0, 0.0, imageSize.width, imageSize.height);
        [srcImage drawInRect:imageRect];
        thumbnail = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    else
    {
        thumbnail = srcImage;
    }
    return thumbnail;
}




/**
 *  解决方向
 */
+ (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

@end
