//
//  CWStarRateView.h
//  StarRateDemo
//
//  Created by WANGCHAO on 14/11/4.
//  Copyright (c) 2014年 wangchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CWStarRateView;
@protocol CWStarRateViewDelegate <NSObject>
@optional
- (void)starRateView:(CWStarRateView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent;
@end

@interface CWStarRateView : UIView

@property (nonatomic, assign) CGFloat scorePercent;//得分值，范围为0--1，默认为1
@property (nonatomic, assign) BOOL hasAnimation;//是否允许动画，默认为NO
@property (nonatomic, assign) BOOL allowIncompleteStar;//评分时是否允许不是整星，默认为NO
@property (nonatomic, assign) BOOL bNeedChange;//评价需要改变,默认为NO

@property (nonatomic, weak) id<CWStarRateViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;

/**
 *  多级评价初始化（重新设置评价图片）
 *
 *  @param frame                      评价窗口大小
 *  @param numberOfStars              评价级数
 *  @param strForegroundStarImageName 前景评价图片
 *  @param strBackgroundStarImageName 背景评价图片
 *
 *  @return 多级评价
 */
- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars foregroundStarImageName:(NSString *)strForegroundStarImageName backgroundStarImageName:(NSString *)strBackgroundStarImageName;

@end