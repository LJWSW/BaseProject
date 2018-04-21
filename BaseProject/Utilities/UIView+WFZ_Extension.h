//
//  UIView+WFZ_Extension.h
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WFZ_Extension)

#pragma --mark-- ⬇️ -- 【rect】 ----

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

#pragma --mark-- ⬆️ -- 【rect】 ----


#pragma --mark-- ⬇️ -- 【Masonry】 ----
/**
 *  横向等间隙的排列一组view
 *
 *  父视图调用该方法前 需先所有子view 并使用Masony指定size
 */
- (void) distributeSpacingHorizontallyWith:(NSArray*)views;
/**
 *  纵向等间隙的排列一组view
 *
 *  父视图调用该方法前 需先所有子view 并使用Masony指定size
 */
- (void) distributeSpacingVerticallyWith:(NSArray*)views;


/**
 *  指定视图上 添加 分区的滚动视图
 *
 *  父视图调用前 只需创建子view 并设置section.height = __;
 *
 *   UIView* section1 = [[UIView alloc]init];
 section1.height = 20;
 UIView* section2 = [[UIView alloc]init];
 section1.height = 200;
 UIView* section3 = [[UIView alloc]init];
 section3.height = 300;
 UIView* section4 = [[UIView alloc]init];
 section4.height = 400;
 
 [view addScrollViewWithSections:@[section1,section2,section3,section4]];
 */
-(void)addScrollViewWithSections:(NSArray <UIView*>*)sections;


/**
 *  添加上分割线
 */
-(void)addTopLineWithHeight:(CGFloat)height;

/**
 *  添加下分割线
 */
-(void)addBottomLineWithHeight:(CGFloat)height;

/**
 *  添加左分割线
 */
-(void)addLeftLineWithWidth:(CGFloat)width;

/**
 *  添加右分割线
 */
-(void)addRightLineWithWidth:(CGFloat)width;
#pragma --mark-- ⬆️ -- 【Masonry】 ----


#pragma --mark-- ⬇️ --为 UIView 添加 圆角 (可指定位置)----
/**
 *  给视图本身添加圆角
 *
 *  要求：控件本身的frame是确定的，非自动布局才行。
 *
 *	@param corner       添加哪些圆角
 *	@param cornerRadius	圆角大小
 *	@param targetSize	目标的frame.size
 */
- (void)addCorner:(UIRectCorner)corner
     cornerRadius:(CGFloat)cornerRadius
             size:(CGSize)targetSize;


#pragma --mark-- ⬆️ --为 UIView 添加 圆角 (可指定位置)----

#pragma --mark-- ⬇️ --【切换视图/更换背景色】膨胀/收缩 动画 ----

/**
 These methods animate background color of a view using shape animation.
 */

/**
 *  膨胀动画
 *
 *  @param point           膨胀中心点
 *  @param backgroundColor 膨胀背景色
 *  @param duration        膨胀时间
 *  @param block           完成后block
 */
- (void)FZ_InflateAnimatedFromPoint:(CGPoint)point
                    backgroundColor:(UIColor *)backgroundColor
                           duration:(NSTimeInterval)duration
                         completion:(void (^)(void))block;

/**
 *  收缩动画
 *
 *  @param point           收缩中心点
 *  @param backgroundColor 收缩背景色
 *  @param duration        收缩时间
 *  @param block           完成后Block
 */

- (void)FZ_DeflateAnimatedToPoint:(CGPoint)point
                  backgroundColor:(UIColor *)backgroundColor
                         duration:(NSTimeInterval)duration
                       completion:(void (^)(void))block;

/**
 Some notes:
 - original point in fromView coordinate system
 - transition uses fromView.superview as containerView
 - transition set toView frame equal to fromView frame
 - transtion uses duration * 0.65 for shape transition and (duration - duration * 0.65) for fade animation, change it if you want
 */

/**
 *  膨胀转场动画
 *
 *  @param fromView      当前视图
 *  @param toView        推出视图
 *  @param originalPoint 膨胀中心点
 *  @param duration      动画时间
 *  @param block         完成后回调
 */
+ (void)FZ_InflateTransitionFromView:(UIView *)fromView
                              toView:(UIView *)toView
                       originalPoint:(CGPoint)originalPoint
                            duration:(NSTimeInterval)duration
                          completion:(void (^)(void))block;

+ (void)FZ_DeflateTransitionFromView:(UIView *)fromView
                              toView:(UIView *)toView
                       originalPoint:(CGPoint)originalPoint
                            duration:(NSTimeInterval)duration
                          completion:(void (^)(void))block;

#pragma --mark-- ⬆️ --【切换视图/更换背景色】膨胀/收缩 动画 ----


@end
