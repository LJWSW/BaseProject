//
//  UIScrollView+WFZ_Extension.m
//  HuMaShiTin
//
//  Created by 吴福增 on 2017/6/7.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import "UIScrollView+WFZ_Extension.h"

@implementation UIScrollView (WFZ_Extension)


#pragma mark -- 处理UIScrollView的点击事件 -----

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGFloat startx = [touch locationInView:self].x;
    NSLog(@"%f",startx);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesEnded:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}



@end
