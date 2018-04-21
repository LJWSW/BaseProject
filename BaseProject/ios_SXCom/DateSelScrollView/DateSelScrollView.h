//
//  DateSelView2.h
//  WXCinema
//
//  Created by 蒋旭峰 on 17/4/10.
//  Copyright © 2017年 蒋旭峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DateSelScrollViewDelegate <NSObject,UIScrollViewDelegate>

- (void)didSelAtIndex:(NSInteger)index andButton:(UIButton *)sender;

@end

@interface DateSelScrollView : UIScrollView

@property (nonatomic, weak) id<DateSelScrollViewDelegate>dateDelegate;

@property (nonatomic, strong) UIView *viewSlider;

@property (nonatomic, strong) NSMutableArray *marrBtn;

- (instancetype)initWithFrame:(CGRect)frame andDateArr:(NSArray *)arrDate needLine:(BOOL)bNeedLine;

- (void)selIndex:(NSInteger)index;

@end
