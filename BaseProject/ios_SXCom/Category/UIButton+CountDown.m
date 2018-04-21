//
//  UIButton+CountDown.m
//  倒计时
//
//  Created by lanou3g on 16/1/5.
//  Copyright © 2016年 syx. All rights reserved.
//

#import "UIButton+CountDown.h"


static dispatch_source_t _timer;

@implementation UIButton (CountDown)


- (void)startWithTime:(NSInteger)timeLine
                title:(NSString *)title
       countDownTitle:(NSString *)subTitle
            mainColor:(UIColor *)mColor
           countColor:(UIColor *)color
{
    WEAKSELF

    // 倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue    = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer                    = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 每秒执行一次
    dispatch_source_set_timer(
                              _timer,
                              dispatch_walltime(NULL, 0),
                              1.0 * NSEC_PER_SEC,
                              0
                              );
    dispatch_source_set_event_handler(_timer, ^{
       
        // 倒计时结束，关闭
        if (timeOut <= 0)
        {
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                weakSelf.backgroundColor = mColor;
                [weakSelf setTitle:title forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = YES;
            });
            
        }
        else
        {
        
            int seconds        = timeOut % 60;
            NSString * timeStr = [NSString stringWithFormat:@"%0.2d",seconds];
            
        
            
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.backgroundColor = color;
                
                [weakSelf setTitle:[NSString stringWithFormat:@"%@%@",timeStr,subTitle] forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = NO;
            });
            
            timeOut--;
        }
    });
    
    dispatch_resume(_timer);
}


/**
 *  取消倒计时
 */

-(void)cancelCountDownWithTitle:(NSString*)title
                      mainColor:(UIColor *)mColor
{
    
    if (!_timer) return;
    WEAKSELF
    dispatch_source_cancel(_timer);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [weakSelf setTitle:title forState:UIControlStateNormal];
        [weakSelf setBackgroundColor:mColor];
        weakSelf.userInteractionEnabled = YES;
    });
}


@end
