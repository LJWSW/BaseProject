//
//  BaseVC.h
//  ProductDemo
//
//  Created by Bibo on 15/5/10.
//  Copyright (c) 2015年 Bibo. All rights reserved.
//

//
//项目基类：主要功能
//1.导航栏返回键的基本框架。
//2.在每页显示时根据页面是否需要登录，判断是否登入，以及对应操作的抽象函数。
//self.bNeedLogin = YES;设置是否需要登录YES：需要，NO：不需要（默认为NO）
//判断是否登入依据[config objectForKey:G_IS_LOGIN]为@"YES"则调用已登录方法，否则调用未登录方法
//需重写的是否登录对应的事件
//- (void)hasLogInWithStatus:(int)status
//{
//    if (status == 0)
//    {
//        NSLog(@"=> 未登录");//未登录方法
//    }
//    else if (status == 1)
//    {
//        NSLog(@"=> 已登录");//已登录方法
//    }
//}
//3.（暂未开放使用）在每页显示时根据页面是否需要网络，判断网络情况，以及对应操作的抽象函数。
//

#import <UIKit/UIKit.h>

@interface BaseVC : UIViewController

@property (nonatomic, strong) UIButton    *cBtnLeft;    //导航左按钮（默认返回图标@"nav_back"）
@property (nonatomic, strong) UIButton    *cBtnRight;   //导航右按钮（默认无内容）
@property (nonatomic, strong) UIImageView *cViewNav;    //导航栏
@property (nonatomic, strong) NSString    *cSuperTitle; //标题（默认无内容）
@property (nonatomic, strong) UILabel     *lblTitle;    //导航栏标题
@property (nonatomic, strong) NSString    *cTitle;  //导航的标题
@property (nonatomic) BOOL bNeedLogin; //设置需要判断登录YES：需要，NO：不需要（默认为NO）

/**
 *  导航左按钮事件（默认返回上一页）
 *
 */
- (void)navLeftPressed;

/**
 *  导航右按钮事件（默认无内容）
 *
 */
- (void)navRightPressed:(id)sender;

/**
 *  是否登录对应的事件（默认无内容）
 *  @param status 0：未登录，1：已登录
 */
- (void)hasLogInWithStatus:(int)status;


@end
