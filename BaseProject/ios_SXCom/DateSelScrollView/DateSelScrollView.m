//
//  DateSelView2.m
//  WXCinema
//
//  Created by 蒋旭峰 on 17/4/10.
//  Copyright © 2017年 蒋旭峰. All rights reserved.
//

#import "DateSelScrollView.h"

#define BLANKWIDTH      100

@implementation DateSelScrollView

- (NSMutableArray *)marrBtn
{
    if (!_marrBtn)
    {
        _marrBtn = [NSMutableArray array];
    }
    
    return _marrBtn;
}

- (UIView *)viewSlider
{
    if (!_viewSlider)
    {
//        CGFloat indentWidth = BLANKWIDTH/self.marrBtn.count - ;
        
        _viewSlider = [[UIView alloc] initWithFrame:CGRectMake(87.5 * G_SCREEN_WIDTHSCALE, self.frame.size.height - 1.5, 200 * G_SCREEN_WIDTHSCALE, 1.5)];
        _viewSlider.layer.cornerRadius = 1.5;
        _viewSlider.layer.masksToBounds = YES;
        _viewSlider.backgroundColor = APP_MAIN_COLOR;//[UIColor whiteColor];
    }
    
    return _viewSlider;
}

- (instancetype)initWithFrame:(CGRect)frame andDateArr:(NSArray *)arrDate needLine:(BOOL)bNeedLine
{
    if (self = [super initWithFrame:frame])
    {
        self.showsHorizontalScrollIndicator = NO;
        
        for (NSString *str in arrDate)
        {
            NSInteger i = [arrDate indexOfObject:str];
            
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i * G_SCREEN_WIDTH/arrDate.count, 0, G_SCREEN_WIDTH/arrDate.count, frame.size.height)];
            [btn addTarget:self action:@selector(userClick:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitleColor:RGBCOLOR(80, 80, 80) forState:UIControlStateNormal];
            [btn setTitleColor:APP_MAIN_COLOR forState:UIControlStateSelected];
            btn.titleLabel.font = G_FONT(30);
            [btn setTitle:arrDate[i] forState:UIControlStateNormal];
            [self addSubview:btn];
            
            if (i == 0)
            {
                btn.selected = YES;
            }
            
            if (bNeedLine)
            {
                UIView *viewLine2 = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - 0.5, G_SCREEN_WIDTH/arrDate.count, 0.5)];
                viewLine2.backgroundColor = APP_LINE_COLOR;
                [btn addSubview:viewLine2];
            }
            
            [self.marrBtn addObject:btn];
            
            self.contentSize = CGSizeMake((i + 1) * (G_SCREEN_WIDTH/arrDate.count), frame.size.height);
        }
        
        [self addSubview:self.viewSlider];
    }
    
    return self;
}

- (void)userClick:(UIButton *)btn
{
    NSInteger i = [self.marrBtn indexOfObject:btn];
    
    [self selIndex:i];
}

- (void)selIndex:(NSInteger)index
{
    UIButton *btn = self.marrBtn[index];
    
    btn.selected = YES;
    
    for (UIButton *button in self.marrBtn)
    {
        if (button != btn)
        {
            button.selected = NO;
        }
    }
    
    [_dateDelegate didSelAtIndex:index andButton:btn];
    
    [UIView animateWithDuration:0.3 animations:^{
        
//        CGFloat indentWidth = BLANKWIDTH/self.marrBtn.count;
        CGFloat indentWidth = 87.5 * G_SCREEN_WIDTHSCALE;
        CGRect frame = self.viewSlider.frame;
        frame.origin.x = btn.left + indentWidth;
        self.viewSlider.frame = frame;
        
        [self scrollRectToVisible:CGRectMake(btn.left - (G_SCREEN_WIDTH - btn.width)/2, 0, G_SCREEN_WIDTH,45) animated:YES];
    }];
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
