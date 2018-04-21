//
//  UITableViewCell+WFZ_Extension.m
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import "UITableViewCell+WFZ_Extension.h"

#import <objc/runtime.h>

/**
 *  关联对象私钥
 */
const void *s_wfz_bottomOffsetToCellKey = @"_wfz_bottomOffsetToCellKey";
const void *s_wfz_lastViewInCellKey     = @"_wfz_lastViewCellKey";

@implementation UITableViewCell(WFZ_Extension)


#pragma --mark-- ⬇️ -- 自动计算cell高 ----

#pragma setting AND getting

- (void)setWfz_bottomOffsetToCell:(CGFloat)wfz_bottomOffsetToCell
{
    
    
    /**
     *  设置 使用给定的密钥和关联政策给定对象关联的值.
     */
    objc_setAssociatedObject(
                             self,
                             s_wfz_bottomOffsetToCellKey,
                             @(wfz_bottomOffsetToCell),
                             OBJC_ASSOCIATION_RETAIN
                             );
}

- (CGFloat)wfz_bottomOffsetToCell
{
    
    /**
     *  返回 使用给定的密钥和关联政策给定对象关联的值.
     */
    NSNumber *objValue = objc_getAssociatedObject(self, s_wfz_bottomOffsetToCellKey);
    
    if (!self) return 0.0;
    
    /**
     *  设置 使用给定的密钥和关联政策给定对象关联的值.
     */
    if ([objValue respondsToSelector:@selector(floatValue)])
    {
        return objValue.floatValue;
    }
    return 0.0;
}

- (void)setWfz_lastViewInCell:(UIView *)wfz_lastViewInCell
{
    objc_setAssociatedObject(
                             self,
                             s_wfz_lastViewInCellKey,
                             wfz_lastViewInCell,
                             OBJC_ASSOCIATION_RETAIN
                             );
}

- (UIView *)wfz_lastViewInCell
{
    /**
     *  返回 使用给定的密钥和关联政策给定对象关联的值.
     */
    return objc_getAssociatedObject(self, s_wfz_lastViewInCellKey);
}



/**
 *  计算Cell的高度
 */
+ (CGFloat)WFZ_tableView:(UITableView *)tableView
                  config:(configBlock)config
{
    
    UITableViewCell *cell = [tableView.wfz_reuseCells objectForKey:[[self class] description]];
    
    if (cell == nil)
    {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault
                           reuseIdentifier:nil
                ];
        
        [tableView.wfz_reuseCells setObject:cell
                                     forKey:[[self class] description]
         ];
    }
    
    if (config)
    {
        config(cell);
    }
    return [cell private_wfz_heightForTableView:tableView];
}

/**
 *  私有方法-计算单元格高度
 */
- (CGFloat)private_wfz_heightForTableView:(UITableView *)tableView
{
    //如果，有需要刷新的标记，立即调用layoutSubviews进行布局（如果没有标记，不会调用layoutSubviews）
    [self layoutIfNeeded];
    
    CGFloat height = self.wfz_lastViewInCell.frame.size.height
    + self.wfz_lastViewInCell.frame.origin.y
    + self.wfz_bottomOffsetToCell;
    
    return height;
}

#pragma --mark-- ⬆️ -- 自动计算cell高 ----



/**
 *  表视图单元格 边距 归零0
 */
- (void)setEdgeInsetsZero
{
    // 是否保持 父视图 （tableView） 的边缘约束
    self.preservesSuperviewLayoutMargins = NO;
    
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
    
}






@end
