//
//  UIImageView+XFSDWebImage.h
//  LoveSports
//
//  Created by 蒋旭峰 on 17/7/22.
//  Copyright © 2017年 july. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (XFSDWebImage)

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

/**
 *  根据imgView尺寸剪裁图片
 */
- (void)xfsd_setSizeFitImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage;

/**
 *  根据imgView尺寸剪裁图片,使用UIActivityIndicatorView
 */
- (void)xfsd_setSizeFitImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle;

/**
 *  使用UIActivityIndicatorView的简单设置网络图片方法
 */
- (void)xfsd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle;

/**
 *  使用UIActivityIndicatorView的基础设置网络图片方法
 */
//- (void)xfsd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle;

@end
