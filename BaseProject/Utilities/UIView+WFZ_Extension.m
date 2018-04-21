//
//  UIView+WFZ_Extension.m
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import "UIView+WFZ_Extension.h"

@interface UIView ()

#pragma --mark-- ⬇️ --XIB 中设置圆角半径\边框宽\边框颜色----
/**
 *  圆角大小
 */
@property (assign,nonatomic) IBInspectable CGFloat cornerRadius;
/**
 *  边框宽
 */
@property (assign,nonatomic) IBInspectable CGFloat borderWidth;
/**
 *  边框颜色
 */
@property (strong,nonatomic) IBInspectable UIColor  *borderColor;
/**
 *  设置 背景色  //使用 十六进制颜色
 */
@property (assign,nonatomic) IBInspectable NSString *hexRgbColor;
///**
// *  是否是单像素
// */
//@property (assign,nonatomic) IBInspectable BOOL      onePx;

#pragma --mark-- ⬆️ --XIB 中设置圆角半径\边框宽\边框颜色----


@end

/**
 *  IB_DESIGNABLE 实时渲染 关键字
 *
 *  代码 编写 实时 在xib中显示 无需 Run（⌘+R）
 *
 *  需要为xib文件关联自定义类
 */
//IB_DESIGNABLE

@implementation UIView (WFZ_Extension)

#pragma --mark-- ⬇️ --为 UIView 添加 圆角 (可指定位置)----
/**
 *  给视图本身添加圆角
 *
 *	@param corner       添加哪些圆角
 *	@param cornerRadius	圆角大小
 *	@param targetSize	目标大小，即控件的frame.size
 */
- (void)addCorner:(UIRectCorner)corner
     cornerRadius:(CGFloat)cornerRadius
             size:(CGSize)targetSize
{
    CGRect frame = CGRectMake(
                              0,
                              0,
                              targetSize.width,
                              targetSize.height
                              );
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:frame
                                               byRoundingCorners:corner
                                                     cornerRadii:CGSizeMake(
                                                                            cornerRadius,
                                                                            cornerRadius
                                                                            )
                          ];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame         = frame;
    layer.path          = path.CGPath;
    self.layer.mask     = layer;
}
#pragma --mark-- ⬆️ --为 UIView 添加 圆角 (可指定位置)----



#pragma --mark-- ⬇️ -- 【rect】 ----

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    //    self.width = size.width;
    //    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

#pragma --mark-- ⬇️ -- 【rect】 ----




#pragma --mark-- ⬇️ -- 【Masonry】 ----

- (void) distributeSpacingHorizontallyWith:(NSArray*)views
{
    NSMutableArray *spaces = [NSMutableArray arrayWithCapacity:views.count+1];
    
    for ( int i = 0 ; i < views.count+1 ; ++i )
    {
        UIView *v = [UIView new];
        [spaces addObject:v];
        [self addSubview:v];
        
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(v.mas_height);
        }];
    }
    
    UIView *v0 = spaces[0];
    
    __weak __typeof(&*self)ws = self;
    
    [v0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.centerY.equalTo(((UIView*)views[0]).mas_centerY);
    }];
    
    UIView *lastSpace = v0;
    for ( int i = 0 ; i < views.count; ++i )
    {
        UIView *obj = views[i];
        UIView *space = spaces[i+1];
        
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastSpace.mas_right);
        }];
        
        [space mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(obj.mas_right);
            make.centerY.equalTo(obj.mas_centerY);
            make.width.equalTo(v0);
        }];
        
        lastSpace = space;
    }
    
    [lastSpace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_right);
    }];
    
}
- (void) distributeSpacingVerticallyWith:(NSArray<UIView*>*)views
{
    NSMutableArray *spaces = [NSMutableArray arrayWithCapacity:views.count+1];
    
    for ( int i = 0 ; i < views.count+1 ; ++i )
    {
        UIView *v = [UIView new];
        [spaces addObject:v];
        [self addSubview:v];
        
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(v.mas_height);
        }];
    }
    
    
    UIView *v0 = spaces[0];
    
    __weak __typeof(&*self)ws = self;
    
    [v0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top);
        make.centerX.equalTo(((UIView*)views[0]).mas_centerX);
    }];
    
    UIView *lastSpace = v0;
    for ( int i = 0 ; i < views.count; ++i )
    {
        UIView *obj = views[i];
        UIView *space = spaces[i+1];
        
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastSpace.mas_bottom);
        }];
        
        [space mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(obj.mas_bottom);
            make.centerX.equalTo(obj.mas_centerX);
            make.height.equalTo(v0);
        }];
        
        lastSpace = space;
    }
    
    [lastSpace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.mas_bottom);
    }];
}


/**
 *  给滚动视图分区
 */
-(void)addScrollViewWithSections:(NSArray <UIView*>*)sections{
    
    __weak __typeof(&*self)ws = self;
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws).with.insets(UIEdgeInsetsZero);
    }];
    
    UIView *container = [[UIView alloc]init];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    UIView *lastView = nil;
    for ( int i = 0 ; i <= sections.count-1 ; i++ )
    {
        UIView *subv = (UIView*)sections[i];
        [container addSubview:subv];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(subv.height));
            
            if ( lastView )
            {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else
            {
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        lastView = subv;
    }
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
    
    
}


/**
 *  添加上分割线
 */
-(void)addTopLineWithHeight:(CGFloat)height{
    UIView*line = [[UIView alloc]init];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self).mas_offset(0);
        make.height.mas_equalTo(height);
    }];
    line.backgroundColor = APP_LINE_COLOR; 
}
/**
 *  添加下分割线
 */
-(void)addBottomLineWithHeight:(CGFloat)height{
    UIView*line = [[UIView alloc]init];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(self).mas_offset(0);
        make.height.mas_equalTo(height);
    }];
    line.backgroundColor = APP_LINE_COLOR;
}

/**
 *  添加左分割线
 */
-(void)addLeftLineWithWidth:(CGFloat)width{
    UIView*line = [[UIView alloc]init];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.top.mas_equalTo(self).mas_offset(0);
        make.width.mas_equalTo(width);
    }];
    line.backgroundColor = APP_LINE_COLOR;
}


/**
 *  添加右分割线
 */
-(void)addRightLineWithWidth:(CGFloat)width{
    UIView*line = [[UIView alloc]init];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.top.mas_equalTo(self).mas_offset(0);
        make.width.mas_equalTo(width);
    }];
    line.backgroundColor = APP_LINE_COLOR;
}
#pragma --mark-- ⬆️ -- 【Masonry】 ----







#pragma --mark-- ⬇️ --XIB 中设置圆角半径\边框宽\边框颜色----

#pragma mark - setCornerRadius/borderWidth/borderColor
/**
 *  圆角半径
 */
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    
    self.layer.cornerRadius  = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}
- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}
/**
 *  边框宽
 */
- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
}
- (CGFloat)borderWidth
{
    return self.layer.borderWidth;
}
/**
 *  边框颜色
 */
- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}
- (UIColor *)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

#pragma mark - hexRgbColor
- (void)setHexRgbColor:(NSString *)hexRgbColor
{
    NSScanner *scanner = [NSScanner scannerWithString:hexRgbColor];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) return;
    self.backgroundColor = [self colorWithRGBHex:hexNum];
}
- (UIColor *)colorWithRGBHex:(UInt32)hex
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

- (NSString *)hexRgbColor
{
    return @"0xffffff";
}

#pragma mark - setOnePx

/**
 *  float scale = [[UIScreenmainScreen] scale];//得到设备的分辨率
 *
 *  scale = 1; 的时候是代表当前设备是320*480的分辨率（就是iphone4之前的设备）
 *
 *  scale = 2; 的时候是代表分辨率为640*960的分辨率
 *
 *  屏幕尺寸的宽高与scale的乘积就是相应的分辨率值。
 */
/**
 *  是否是单个像素
 */
//- (void)setOnePx:(BOOL)onePx
//{
//    if (onePx)
//    {
//        CGRect rect      = self.frame;
//        rect.size.height = 1.0 / [UIScreen mainScreen].scale;
//        self.frame       = rect;
//    }
//    NSLog(@"%@",NSStringFromCGRect(self.frame));
//
//}
//- (BOOL)onePx
//{
//    return self.onePx;
//}
//
#pragma --mark-- ⬆️ --XIB 中设置圆角半径\边框宽\边框颜色----


#pragma --mark-- ⬇️ --【切换视图/更换背景色】膨胀/收缩 动画 ----

//Inspired by [Material Design guideline](http://www.google.ru/design/spec/material-design/introduction.html) from Google.
//效果图：https://raw.githubusercontent.com/moqod/ios-material-design/master/md.gif

/**
 *  动画时间 比例
 *
 *  动画是分段组合
 *
 * 设置的duration 是总动画时间
 */
const CGFloat UIViewInflateOrDeflateTransitionDurationCoeff = 0.65;

#pragma mark - public methods

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
                         completion:(void (^)(void))block {
    
    [self FZ_AnimateAtPoint:point
            backgroundColor:backgroundColor
                   duration:duration
                  inflating:YES
               zTopPosition:NO
                 shapeLayer:nil
                 completion:block
     ];
}

/**
 *  收缩动画
 *
 *  @param point           收缩中心
 *  @param backgroundColor 收缩背景色
 *  @param duration        收缩时间
 *  @param block           完成后Block
 */
- (void)FZ_DeflateAnimatedToPoint:(CGPoint)point
                  backgroundColor:(UIColor *)backgroundColor
                         duration:(NSTimeInterval)duration
                       completion:(void (^)(void))block {
    
    [self FZ_AnimateAtPoint:point
            backgroundColor:backgroundColor
                   duration:duration
                  inflating:NO
               zTopPosition:NO
                 shapeLayer:nil
                 completion:block
     ];
}


/**
 *  膨胀转场动画
 *
 *  @param fromView      当前视图
 *  @param toView        推出视图
 *  @param originalPoint 膨胀中心
 *  @param duration      动画时间
 *  @param block         完成后回调
 */
+ (void)FZ_InflateTransitionFromView:(UIView *)fromView
                              toView:(UIView *)toView
                       originalPoint:(CGPoint)originalPoint
                            duration:(NSTimeInterval)duration
                          completion:(void (^)(void))block
{
    if (fromView.superview)
    {
        UIView *containerView  = fromView.superview;
        /**
         *  把一个点从一个坐标系转换到指定视图的坐标系 返回值基于视图的坐标系转换过的点
         */
        CGPoint convertedPoint = [fromView convertPoint:originalPoint
                                               fromView:fromView
                                  ];
        containerView.layer.masksToBounds = YES;
        [containerView FZ_AnimateAtPoint:convertedPoint
                         backgroundColor:toView.backgroundColor
                                duration:duration * UIViewInflateOrDeflateTransitionDurationCoeff
                               inflating:YES
                            zTopPosition:YES
                              shapeLayer:nil
                              completion:^{
                                  toView.alpha = 0.0;
                                  // TODO: transform property could be not identity
                                  toView.frame = fromView.frame;
                                  // 添加 新的view
                                  [containerView addSubview:toView];
                                  //移除旧的view
                                  [fromView removeFromSuperview];
                                  
                                  NSTimeInterval animationDuration = (duration - duration * UIViewInflateOrDeflateTransitionDurationCoeff);
                                  //新视图 透明度由浅变深 动画
                                  [UIView animateWithDuration:animationDuration
                                                   animations:^{
                                                       toView.alpha = 1.0;
                                                   }
                                                   completion:^(BOOL finished) {
                                                       if (block)
                                                       {
                                                           block();
                                                       }
                                                   }];
                              }];
    }
    else
    {
        if (block)
        {
            block();
        }
    }
}

/**
 *  收缩转场动画
 *
 *  @param fromView      当前视图
 *  @param toView        推出视图
 *  @param originalPoint 膨胀中心
 *  @param duration      动画时间
 *  @param block         完成后回调
 */
+ (void)FZ_DeflateTransitionFromView:(UIView *)fromView
                              toView:(UIView *)toView
                       originalPoint:(CGPoint)originalPoint
                            duration:(NSTimeInterval)duration
                          completion:(void (^)(void))block {
    
    if (fromView.superview)
    {
        // insert destination view
        UIView *containerView = fromView.superview;
        [containerView insertSubview:toView
                        belowSubview:fromView];
        toView.frame = fromView.frame;
        
        /**
         *  把一个点从一个坐标系转换到指定视图的坐标系 返回值基于视图的坐标系转换过的点
         */
        CGPoint convertedPoint = [toView convertPoint:originalPoint
                                             fromView:fromView];
        
        /**
         *  插入图形层
         */
        CAShapeLayer *layer = [toView FZ_ShapeLayerForAnimationAtPoint:convertedPoint];
        layer.fillColor     = fromView.backgroundColor.CGColor;
        [toView.layer addSublayer:layer];
        toView.layer.masksToBounds = YES;
        
        // hide fromView
        NSTimeInterval animationDuration = (duration - duration * UIViewInflateOrDeflateTransitionDurationCoeff);
        [UIView animateWithDuration:animationDuration
                         animations:^{
                             fromView.alpha = 0.0;
                         }
                         completion:^(BOOL finished) {
                             // perform disappear animation
                             [toView FZ_AnimateAtPoint:convertedPoint
                                       backgroundColor:fromView.backgroundColor
                                              duration:duration * UIViewInflateOrDeflateTransitionDurationCoeff
                                             inflating:NO
                                          zTopPosition:YES
                                            shapeLayer:layer
                                            completion:^{
                                                if (block)
                                                {
                                                    block();
                                                }
                                            }];
                         }];
    }
    else
    {
        if (block)
        {
            block();
        }
        
    }
}



#pragma mark - helpers

/**
 *  获取图形层直径 【取当前点到 四角点 最大距离 为半径】
 *
 *  @param point 当前点
 *
 *  @return 直径
 */
- (CGFloat)FZ_ShapeDiameterForPoint:(CGPoint)point
{
    
    // 四个角的点
    CGPoint cornerPoints[] = {
        {0.0, 0.0},
        {0.0, self.bounds.size.height},
        {self.bounds.size.width, self.bounds.size.height},
        {self.bounds.size.width, 0.0}
    };
    CGFloat radius = 0.0;
    for (int i = 0; i < sizeof(cornerPoints) / sizeof(CGPoint); i++)
    {
        CGPoint p = cornerPoints[i];
        /**
         *  勾股定理 计算两点间距离
         *
         *  pow(double x, double y）;计算以x为底数的y次幂
         */
        CGFloat d = sqrt( pow(p.x - point.x, 2.0) + pow(p.y - point.y, 2.0) );
        if (d > radius)
        {
            radius = d;
        }
    }
    return radius * 2.0;
}

/**
 *  创建图形层对象
 *
 *  @param point 当前点
 *
 *  @return 图形层
 */
- (CAShapeLayer *)FZ_ShapeLayerForAnimationAtPoint:(CGPoint)point
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    CGFloat diameter         = [self FZ_ShapeDiameterForPoint:point];
    // 图形层frame (目的：图形层中心为 当前点)
    shapeLayer.frame         = CGRectMake(
                                          floor(point.x - diameter * 0.5),
                                          floor(point.y - diameter * 0.5),
                                          diameter,
                                          diameter
                                          );
    
    //图形层路径
    shapeLayer.path          = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(
                                                                                 0.0,
                                                                                 0.0,
                                                                                 diameter,
                                                                                 diameter
                                                                                 )].CGPath;
    return shapeLayer;
}

/**
 *  创建图形层动画对象
 *
 *  @param timingFunction 动画函数
 *  @param scale          比例
 *  @param inflating      是否膨胀
 *
 *  @return 基础动画对象
 */
- (CABasicAnimation *)shapeAnimationWithTimingFunction:(CAMediaTimingFunction *)timingFunction
                                                 scale:(CGFloat)scale
                                             inflating:(BOOL)inflating {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    if (inflating)
    {
        animation.toValue   = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
        animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, 1.0)];
    }
    else
    {
        animation.toValue   = [NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, 1.0)];
        animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
    }
    animation.timingFunction      = timingFunction;
    animation.removedOnCompletion = YES;
    
    return animation;
}

#pragma mark - animation

/**
 *  动画
 *
 *  @param point           起点
 *  @param backgroundColor 背景色
 *  @param duration        时间
 *  @param inflating       是否是膨胀
 *  @param zTopPosition    是否是Z轴顶端位置
 *  @param shapeLayer      图形层（收缩转场时需要）
 *  @param block           完成后回调
 */
- (void)FZ_AnimateAtPoint:(CGPoint)point
          backgroundColor:(UIColor *)backgroundColor
                 duration:(NSTimeInterval)duration
                inflating:(BOOL)inflating
             zTopPosition:(BOOL)zTopPosition
               shapeLayer:(CAShapeLayer *)shapeLayer
               completion:(void (^)(void))block {
    
    if (!shapeLayer)
    {
        // create layer
        shapeLayer = [self FZ_ShapeLayerForAnimationAtPoint:point];
        self.layer.masksToBounds = YES;
        if (zTopPosition)
        {
            [self.layer addSublayer:shapeLayer];
        }
        else
        {
            [self.layer insertSublayer:shapeLayer atIndex:0];
        }
        
        if (!inflating)
        {
            shapeLayer.fillColor = self.backgroundColor.CGColor;
            self.backgroundColor = backgroundColor;
        }
        else
        {
            shapeLayer.fillColor = backgroundColor.CGColor;
        }
    }
    
    /**
     *  图形层动画
     */
    
    // animate
    CGFloat scale = 1.0 / shapeLayer.frame.size.width;
    NSString *timingFunctionName = kCAMediaTimingFunctionDefault;//inflating ? kCAMediaTimingFunctionDefault : kCAMediaTimingFunctionDefault;
    // 创建图形层动画对象
    CABasicAnimation *animation =
    [self shapeAnimationWithTimingFunction:[CAMediaTimingFunction functionWithName:timingFunctionName]
                                     scale:scale
                                 inflating:inflating
     ];
    
    animation.duration   = duration;
    shapeLayer.transform = [animation.toValue CATransform3DValue];
    
    // 显式 动画
    
    __block UIView *selfRef = self;
    
    [CATransaction begin];
    
    // 动画完成 后 回调
    [CATransaction setCompletionBlock:^{
        if (inflating)
        {
            selfRef.backgroundColor = backgroundColor;
        }
        [shapeLayer removeFromSuperlayer];
        if (block)
        {
            block();
        }
    }];
    
    // 添加动画
    [shapeLayer addAnimation:animation
                      forKey:@"shapeBackgroundAnimation"
     ];
    
    [CATransaction commit];
}

#pragma --mark-- ⬆️ --【切换视图/更换背景色】膨胀/收缩 动画 ----


@end
