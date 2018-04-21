//
//  ImageScrollView.h
//  Ios_HYCom_Demo
//
//  Created by 姚碧波 on 15/8/15.
//  Copyright (c) 2015年 BourneYao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
@class HYImageScrollView;

@protocol HYImageScrollViewDelegate <NSObject>

@optional

- (void)ImageScrollUserClickedAtPage:(NSInteger)currentPage;
- (void)ImageScroll:(HYImageScrollView *)imageScrollView UserClickedAtPage:(NSInteger)currentPage WithTapper:(UITapGestureRecognizer *)tapper;
- (void)didScrollAtPage:(NSInteger)currentPage;

@end

@interface HYImageScrollView : UIView<UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *marrImageList;//广告页图片
@property (nonatomic) BOOL bNeedStopScrollWithOnePic;//是否需在仅有一张广告页是禁止滚动
@property (nonatomic) BOOL bNotNeedScroll;//不需要滚动
@property (nonatomic, strong) UIPageControl  *pageControl;
@property (nonatomic, retain) id<HYImageScrollViewDelegate>delegate;
@property (nonatomic)BOOL bNeedImageScroll;

- (UIView *)initWithFrame:(CGRect)frame marrImages:(NSMutableArray *)marrImages;
- (void)startScroll;
- (void)stopScroll;

@end
