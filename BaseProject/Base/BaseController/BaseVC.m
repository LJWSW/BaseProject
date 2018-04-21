//
//  BaseVC.m
//  ShoeCity
//
//  Created by Bibo on 15/5/10.
//  Copyright (c) 2015年 Bibo. All rights reserved.
//

#import "BaseVC.h"


@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initNavView];
    
    [self.navigationController setNavigationBarHidden:YES];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    if (_bNeedLogin)//需要登录
//    {
//        NSUserDefaults *config = [NSUserDefaults standardUserDefaults];
//        
//        //判断是否登录
//        NSString *strIsLogIn = [config objectForKey:G_IS_LOGIN];
//        if ([strIsLogIn isEqualToString:@"YES"])
//        {
//            [self hasLogInWithStatus:1];
//        }
//        else
//        {
//            [self hasLogInWithStatus:0];
//        }
//    }    
}

- (void)initNavView
{
    //导航栏
    _cViewNav                 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, SafeAreaTopHeight)];
    _cViewNav.userInteractionEnabled = YES;
    _cViewNav.backgroundColor = [UIColor whiteColor];
    //G_THEME_COLOR
    [self.view addSubview:_cViewNav];
    
    //标题
    _lblTitle               = [[UILabel alloc] initWithFrame:CGRectMake(60, SafeAreaTopHeight - 40, [UIScreen mainScreen].bounds.size.width-120, 30)];
    _lblTitle.textAlignment = NSTextAlignmentCenter;
    _lblTitle.font          = [UIFont boldSystemFontOfSize:17];
    _lblTitle.textColor     = G_TEXT_COLOR;//[UIColor blackColor];
    [_cViewNav addSubview:_lblTitle];
    
    //左按钮
    _cBtnLeft = [[UIButton alloc] initWithFrame:CGRectMake(0,SafeAreaTopHeight - 44, 40, 44)];
    [_cBtnLeft setImage:[UIImage imageNamed:@"fh"] forState:UIControlStateNormal];
    [_cBtnLeft addTarget:self action:@selector(navLeftPressed) forControlEvents:UIControlEventTouchUpInside];
    [_cViewNav addSubview:_cBtnLeft];
    
    //右按钮
    _cBtnRight = [[UIButton alloc] initWithFrame:CGRectMake(G_SCREEN_WIDTH - 60, SafeAreaTopHeight - 44, 60, 44)];
    _cBtnRight.titleLabel.font = [UIFont systemFontOfSize:15];
    [_cBtnRight setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_cBtnRight addTarget:self action:@selector(navRightPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_cViewNav addSubview:_cBtnRight];
}


/**
 *  重写Title
 *
 *  @param cSuperTitle
 */
- (void)setCSuperTitle:(NSString *)cSuperTitle
{
    if (cSuperTitle.length > 0)
    {
        _lblTitle.text = cSuperTitle;
    }
}

/**
 *  导航左按钮事件（默认返回上一页）
 *
 */
- (void)navLeftPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  导航右按钮事件（默认无内容）
 *
 */
- (void)navRightPressed:(id)sender
{
    NSLog(@"=> navRightPressed !");
}

/**
 *  是否登录对应的事件（默认无内容）
 *  @param status 0：未登录，1：已登录
 */
- (void)hasLogInWithStatus:(int)status
{
    if (status == 0)
    {
        NSLog(@"=> 未登录");
    }
    else if (status == 1)
    {
        NSLog(@"=> 已登录");
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
