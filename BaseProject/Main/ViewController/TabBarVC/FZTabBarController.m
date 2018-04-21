//
//  XZTableViewController.m
//  BaseProject
//
//  Created by 吴福增 on 16/3/16.
//  Copyright © 2016年 wufuzeng. All rights reserved.
//

#import "FZTabBarController.h"
#import "FZNavigationController.h"

#import "HomePageVC.h"
#import "MineVC.h"

@interface FZTabBarController()

@end

@implementation FZTabBarController


#pragma mark -- LifeCircle ----
/** 类初始化方法 */
+ (void)initialize
{
    /**
     *  设置底部tabbar的主题样式
     */
    UITabBarItem *appearance = [UITabBarItem appearance];
    
    [[UITabBar appearance] setBarTintColor:RGBCOLOR(26, 26, 25)];
    [UITabBar appearance].translucent = NO;
    
    /**
     *  设置 标题的前景色
     */
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:APP_TITLE_COLOR_3, NSForegroundColorAttributeName,nil]
                              forState:UIControlStateNormal];
    
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:APP_MAIN_COLOR,NSForegroundColorAttributeName,nil]
                              forState:UIControlStateSelected];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 添加所有子控制器 */
    [self addAllChildVcs];
    
    self.selectedIndex = 0;
    
}




#pragma mark -- customFuntion ----

/** 添加所有子控制器 */
-(void)addAllChildVcs
{
    HomePageVC *homeVC = [[HomePageVC alloc] init];
    [self addOneChildVc:homeVC title:@"首页" imageName:@"syh" selectedImageName:@"sy"];
//    SchoolVC *schoolVC = [[SchoolVC alloc] init];
//    [self addOneChildVc:schoolVC title:@"医身学堂" imageName:@"ysxth" selectedImageName:@"ysxt"];
//    HealthVC *healthVC = [[HealthVC alloc] init];
//    [self addOneChildVc:healthVC title:@"BTV养生会" imageName:@"yshh" selectedImageName:@"ysh"];
    MineVC *mineVC = [[MineVC alloc] init];
    [self addOneChildVc:mineVC title:@"我的" imageName:@"wdh" selectedImageName:@"wd"];
    
//    LWTabbar *tabBar = [[LWTabbar alloc] init];
//    tabBar.delegate = self;
//    [self setValue:tabBar forKey:@"tabBar"];
}

/** 增加一个子控制器并配置 */
- (void)addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    
    /**
     *  设置标题
     */
    childVc.tabBarItem.title = title;
    
    /**
     *  设置未选中图标
     */
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    /**
     *  设置选中图标
     */
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    /**
     *  设置图片渲染为原始类型
     */
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(-1, 0, 1, 0);
    [childVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -4)];
    
    
    /**
     *  添加导航控制器
     */
    FZNavigationController *nav = [[FZNavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
}

//#pragma mark - UITabBarButton
//
//- (void)tabBarButtonClick:(LWTabbar *)tabBar
//{
//
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    if (![defaults boolForKey:app_Version])
//    {
//        VideoVC *vc = [[VideoVC alloc] init];
//        vc.hidesBottomBarWhenPushed = YES;
//        [[[self class] topViewController].navigationController pushViewController:vc animated:YES];
//
//        [defaults setBool:YES forKey:app_Version];
//        [defaults synchronize];
//    }
//    else
//    {
//        VideoInfoRootVC *vc = [[VideoInfoRootVC alloc] init];
//        vc.hidesBottomBarWhenPushed = YES;
//        [[[self class] topViewController].navigationController pushViewController:vc animated:YES];
//    }
//}
//
//+ (UIViewController *)topViewController
//{
//    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
//}
//
//+ (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootViewController
//{
//    if ([rootViewController isKindOfClass:[UITabBarController class]])
//    {
//        UITabBarController *tabBarController = (UITabBarController*)rootViewController;
//        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
//    }
//    else if ([rootViewController isKindOfClass:[UINavigationController class]])
//    {
//        UINavigationController *navigationController = (UINavigationController*)rootViewController;
//        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
//    }
//    else if (rootViewController.presentedViewController)
//    {
//        UIViewController *presentedViewController = rootViewController.presentedViewController;
//        return [self topViewControllerWithRootViewController:presentedViewController];
//    }
//    else
//    {
//        return rootViewController;
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
