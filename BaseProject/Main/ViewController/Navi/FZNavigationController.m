//
//  FZNavigationController.m
//  BaseProject
//
//  Created by 吴福增 on 16/3/16.
//  Copyright © 2016年 wufuzeng. All rights reserved.
//

#import "FZNavigationController.h"

@interface FZNavigationController ()

@end

@implementation FZNavigationController

/**
 *  类初始化
 */
+ (void)initialize
{
    [self setupNavigationBarTheme];
    [self setupBarButtonItemTheme];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- SetupFunction ----

/**
 *  UINavigationBarTheme
 */
+ (void)setupNavigationBarTheme{

    UINavigationBar *appearance = [UINavigationBar appearance];
    /**
     *  设置文字属性
     */
    NSMutableDictionary *textAttrs            = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName]            = APP_NAVI_BAR_FONT;
    
    [appearance setTitleTextAttributes:textAttrs];

    /**
     *  设置导航栏颜色tintColor
     */
    [appearance setBarTintColor:APP_THEME_COLOR];
    /**
     *  是否透明 否
     */
    [appearance setTranslucent:NO];
    

}

/**
 *  UIBarButtonItem的主题
 */
+ (void)setupBarButtonItemTheme{
    
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    /**
     *  设置普通状态的文字属性
     */
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        APP_SUBTITLE_COLOR,
                                        NSForegroundColorAttributeName,
                                        [UIFont systemFontOfSize:15],
                                        NSFontAttributeName,
                                        nil
                                        ]
                              forState:UIControlStateNormal];
    
    /**
     *  自定义返回按钮 样式
     */
    [[UINavigationBar appearance] setBackIndicatorImage:[[UIImage imageNamed:@"fh"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"fh"]];
    
    /**
     *  将返回按钮的文字position设置不在屏幕上显示  宏为系统宏定义
     *  【该方法BUG: 在每次app退回后台的时候、当前app没有被kill、然后再次切回app时、会闪现一下主屏幕】
     */
    //    [appearance setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    
    //修改导航条标题颜色（白色）
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,nil]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark -手势 方法- Gesture recognizer






@end
