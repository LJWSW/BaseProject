//
//  UIImageView+XFSDWebImage.m
//  LoveSports
//
//  Created by 蒋旭峰 on 17/7/22.
//  Copyright © 2017年 july. All rights reserved.
//

#import "UIImageView+XFSDWebImage.h"
#import "UIImage+CutSize.h"

#import <objc/runtime.h>

static char TAG_ACTIVITY_INDICATOR;

@interface UIImageView (Private)

-(void)addActivityIndicatorWithStyle:(UIActivityIndicatorViewStyle) activityStyle;

@end

@implementation UIImageView (XFSDWebImage)

@dynamic activityIndicator;

- (UIActivityIndicatorView *)activityIndicator {
    return (UIActivityIndicatorView *)objc_getAssociatedObject(self, &TAG_ACTIVITY_INDICATOR);
}

- (void)setActivityIndicator:(UIActivityIndicatorView *)activityIndicator {
    objc_setAssociatedObject(self, &TAG_ACTIVITY_INDICATOR, activityIndicator, OBJC_ASSOCIATION_RETAIN);
}

- (void)addActivityIndicatorWithStyle:(UIActivityIndicatorViewStyle)activityStyle {
    
    if (!self.activityIndicator) {
        self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:activityStyle];
        
        self.activityIndicator.autoresizingMask = UIViewAutoresizingNone;
        
        [self updateActivityIndicatorFrame];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [self addSubview:self.activityIndicator];
        });
    }
    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [self.activityIndicator startAnimating];
    });
    
}

-(void)updateActivityIndicatorFrame {
    if (self.activityIndicator) {
        CGRect activityIndicatorBounds = self.activityIndicator.bounds;
        float x = (self.frame.size.width - activityIndicatorBounds.size.width) / 2.0;
        float y = (self.frame.size.height - activityIndicatorBounds.size.height) / 2.0;
        self.activityIndicator.frame = CGRectMake(x, y, activityIndicatorBounds.size.width, activityIndicatorBounds.size.height);
    }
}

- (void)removeActivityIndicator {
    if (self.activityIndicator) {
        [self.activityIndicator removeFromSuperview];
        self.activityIndicator = nil;
    }
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    [self updateActivityIndicatorFrame];
}


#pragma mark - 外部方法实现
/**
 *  根据imgView尺寸剪裁图片
 */
- (void)xfsd_setSizeFitImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage
{
    __weak __typeof(&*self) weakImageView = self;
    [self sd_setImageWithURL:url
            placeholderImage:placeholderImage
                     options:SDWebImageAvoidAutoSetImage // 下载完成后不要自动设置image
                    completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                        
                        __block UIImage *editImg;
                        
                        if (image)
                        {
                            editImg = image;
                        }
                        else
                        {
                            editImg = [UIImage imageNamed:url.absoluteString];
                        }
                        
                        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                            
                            editImg = [editImg cutWithSize:weakImageView.frame.size]; // 后台线程剪裁图片
                            
                            dispatch_async(dispatch_get_main_queue(), ^{
                                __typeof(&*weakImageView) strongImageView = weakImageView;
                                if (strongImageView) {
                                    strongImageView.image = editImg;
                       
                                    [strongImageView setNeedsLayout];
                                }
                            });
                        });
                    }];
}

- (void)xfsd_setSizeFitImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle
{
    __weak __typeof(&*self) weakImageView = self;
    
    [self addActivityIndicatorWithStyle:activityStyle];
    
    [self sd_setImageWithURL:url
            placeholderImage:placeholderImage
                     options:SDWebImageAvoidAutoSetImage // 下载完成后不要自动设置image
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       
                       __block UIImage *editImg;
                       
                       if (image)
                       {
                           editImg = image;
                       }
                       else
                       {
                           editImg = [UIImage imageNamed:url.absoluteString];
                       }
                       
                       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                           
                           editImg = [editImg cutWithSize:weakImageView.frame.size]; // 后台线程剪裁图片
                           
                           dispatch_async(dispatch_get_main_queue(), ^{
                               __typeof(&*weakImageView) strongImageView = weakImageView;
                               if (strongImageView) {
                                   strongImageView.image = editImg;
                                   
                                   [strongImageView setNeedsLayout];
                               }
                           });
                       });
                   
                       [weakImageView removeActivityIndicator];
                   }];
}

/**
 *  使用UIActivityIndicatorView的简单设置网络图片方法
 */
//- (void)xfsd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle
//{
//    [self xfsd_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:nil usingActivityIndicatorStyle:activityStyle];
//}


/**
 *  使用UIActivityIndicatorView的基础设置网络图片方法
 */
//- (void)xfsd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle
//{
//    [self addActivityIndicatorWithStyle:activityStyle];
//
//    __weak typeof(self) weakSelf = self;
//    [self sd_setImageWithURL:url
//            placeholderImage:placeholder
//                     options:options
//                    progress:progressBlock
//                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageUrl) {
//                       if (completedBlock) {
//                           completedBlock(image, error, cacheType, imageUrl);
//                       }
//                       [weakSelf removeActivityIndicator];
//                   }
//     ];
//
//}

@end
