//
//  UIImage+CutSize.m
//  NewMileCar
//
//  Created by 蒋旭峰 on 16/12/14.
//  Copyright © 2016年 蒋旭峰. All rights reserved.
//

#import "UIImage+CutSize.h"

@implementation UIImage (CutSize)

//- (BOOL)willDealloc {
//    __weak id weakSelf = self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [weakSelf assertNotDealloc];
//    });
//    return YES;
//}
//- (void)assertNotDealloc {
//    NSAssert(NO, @"");
//}

- (UIImage *)cutWithSize:(CGSize)size
{
    CGRect rect;
    CGFloat imgWidth = self.size.width;
    CGFloat imgHeight = self.size.height;
    
    CGFloat wbg = size.width/size.height;
    
    if (imgWidth>imgHeight*wbg)
    {
        rect = CGRectMake((imgWidth-imgHeight*wbg)/2, 0, imgHeight*wbg, imgHeight);
    }
    else
    {
        rect = CGRectMake(0, (imgHeight-imgWidth/wbg)/2, imgWidth, imgWidth/wbg);
    }
    
    CGImageRef imageRef = self.CGImage;
    CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef, rect);
    UIImage *editImage = [UIImage imageWithCGImage:imagePartRef];
    
    CGImageRelease(imagePartRef);
    
    return editImage;
}

+ (instancetype)fixOrientation:(UIImage *)image
{
    //    if (image.imageOrientation == UIImageOrientationUp)
    //        return image;
    
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (image.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, image.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,
                                             CGImageGetBitsPerComponent(image.CGImage), 0,
                                             CGImageGetColorSpace(image.CGImage),
                                             CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (image.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.width,image.size.height), image.CGImage);
            break;
    }
    
    
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    
    
    
    //cut
    CGRect rect;
    CGFloat imgWidth = img.size.width;
    CGFloat imgHeight = img.size.height;
    
    if (imgWidth>imgHeight)
    {
        rect = CGRectMake((imgWidth-imgHeight)/2, 0, imgHeight, imgHeight);
    }
    else
    {
        rect = CGRectMake(0, (imgHeight-imgWidth)/2, imgWidth, imgWidth);
    }
    
    CGImageRef imageRef = img.CGImage;
    CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef, rect);
    UIImage *editImage = [UIImage imageWithCGImage:imagePartRef];
    
    CGImageRelease(imagePartRef);
    
    return editImage;
}


@end
