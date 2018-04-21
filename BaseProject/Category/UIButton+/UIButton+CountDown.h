//
//  UIButton+CountDown.h
//  倒计时
//
//  Created by lanou3g on 16/1/5.
//  Copyright © 2016年 syx. All rights reserved.
//

/**
 *  倒计时按钮
 *
 *  用于：获取验证码时的倒计时
 */

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)

//{
//    dispatch_source_t timer;
//}

/*
 *    倒计时按钮
 *    @param timeLine  倒计时总时间
 *    @param title     倒计时结束后的title @"重新获取"
 *    @param subTitle  倒计时的时间单位 @"秒"/@"S"
 *    @param mColor    倒计时结束后的背景色
 *    @param color     倒计时的背景颜色
 */

- (void)startWithTime:(NSInteger)timeLine
                title:(NSString *)title
       countDownTitle:(NSString *)subTitle
            mainColor:(UIColor *)mColor
           countColor:(UIColor *)color;


/**
 *  取消倒计时
 *
 *  @param title  倒计时结束时的title
 *  @param mColor 倒计时结束时颜色
 */
-(void)cancelCountDownWithTitle:(NSString*)title
                      mainColor:(UIColor *)mColor;

@end
