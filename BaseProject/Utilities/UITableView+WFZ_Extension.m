//
//  UITableView+WFZ_Extension.m
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import "UITableView+WFZ_Extension.h"

#import <objc/runtime.h>

/**
 *  关联对象私钥
 *
 *   用于 自动计算 Cell 行高
 */
const void *__wfz_tableView_reuseCell = @"__wfz_tableView_reuseCellKey";

@implementation UITableView(WFZ_Extension)

/**
 *  表视图 边距 归零0
 */
- (void)UIEdgeInsetsZero
{
    if ([self respondsToSelector:@selector(setSeparatorInset:)])
    {
        
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)])
    {
        
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
    
}

#pragma --mark-- ⬇️ -- 用于 自动计算cell高 ---
/**
 *  用于获取Cell的行高,只需要一个就够了
 */
- (NSMutableDictionary *)wfz_reuseCells{
    
    /**
     *  返回与一个给定的密钥给定对象关联的值.
     */
    NSMutableDictionary *cells = objc_getAssociatedObject(self, __wfz_tableView_reuseCell);
    
    if (cells == nil)
    {
        cells = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(
                                 self,
                                 __wfz_tableView_reuseCell,
                                 cells,
                                 OBJC_ASSOCIATION_RETAIN
                                 );
    }
    /**
     *  打印cells 字典如下：
     */
    //    XZGoodEvaluationTableViewCell = <XZGoodEvaluationTableViewCell: 0x1019d6200;
    //                        baseClass = UITableViewCell;
    //                            frame = (0 0; 320 44);
    //                            layer = <CALayer: 0x170238e00>>;
    
    
    return cells;
}



@end
