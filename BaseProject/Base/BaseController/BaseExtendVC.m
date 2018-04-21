//
//  BaseExtendVC.m
//  ProductDemo
//
//  Created by yixiaoshan on 15/9/21.
//  Copyright (c) 2015年 HYcompany. All rights reserved.
//

#import "BaseExtendVC.h"

//#import "MyGifHeader.h"

#import "FZNavigationController.h"


@interface BaseExtendVC ()<UIGestureRecognizerDelegate>

@end

@implementation BaseExtendVC

- (NSString *)timeWithzTimeIntervalString:(long long)timeString
{
    NSString *timeStr = [NSString stringWithFormat:@"%lld",timeString];
    NSTimeInterval interval = [timeStr doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [formatter stringFromDate:date];
    
    return strDate;
}

- (NSString *)timeWithExactTimeIntervalString:(long long)timeString
{
    NSString *timeStr = [NSString stringWithFormat:@"%lld",timeString];
    NSTimeInterval interval = [timeStr doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [formatter stringFromDate:date];
    
    return strDate;
}

- (void)setStatusColor:(StatusColor)statusColor
{
    
    if (statusColor == Black)
    {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
    else if (statusColor == White)
    {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    _statusColor = statusColor;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = !self.isNotCanBePop;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.statusColor = self.statusColor;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.statusColor = Black;
    
    self.cBtnLeft.hidden = self.isNotCanBePop;
    
    //隐藏系统导航栏
    self.navigationController.navigationBar.hidden = YES;
    
    self.bNeedLogin = NO;
    
//    self.cViewNav.backgroundColor = [UIColor whiteColor];
    
//    [self.cBtnLeft setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    
//    self.navLine = [self getLineWithFrame:CGRectMake(0, 63.5, G_SCREEN_WIDTH, 0.5)];
//    [self.cViewNav addSubview:self.navLine];
    
}


/**
 *  弹出登录
 */
- (void)loginPresentWithLoginType:(LoginType)type previousVCClass:(Class)previousVCClass
{
    
    [gUserInfo clearUserInfo];
    
    __weak UIViewController* temp = [UIViewController currentTopViewController];
    
}

/**
 *  获取自定义线条
 */
- (UIView *)getLineWithFrame:(CGRect)frame
{
    UIView *viewLine = [[UIView alloc] initWithFrame:frame];
    viewLine.backgroundColor = G_SYSTEMLINE_COLOR;
    return viewLine;
}

- (CALayer *)getLayerLineWithFrame:(CGRect)frame
{
    CALayer *lineLayer = [CALayer layer];
    lineLayer.backgroundColor = [G_SYSTEMLINE_COLOR CGColor];
    lineLayer.frame = frame;
    return lineLayer;
}

- (void)setUserDefaultWithObj:(id)obj key:(NSString *)key
{
    NSUserDefaults *config = [NSUserDefaults standardUserDefaults];
    [config setObject:obj forKey:key];
    [config synchronize];
}

- (id)getUserDefaultWittKey:(NSString *)key
{
    NSUserDefaults *config = [NSUserDefaults standardUserDefaults];
    return [config objectForKey:key];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
