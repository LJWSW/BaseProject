//
//  UITableViewCell+WFZ_Extension.h
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  配置cell 【用于自动计算cell 行高】
 *
 *  @param sourceCell sourceCell
 */
typedef void (^configBlock)(UITableViewCell *sourceCell);

@interface UITableViewCell(WFZ_Extension)


#pragma --mark-- ⬇️ -- 自动计算cell高 ----

/**
 *  cell里面的最后一个View
 */
@property (nonatomic, strong) UIView *wfz_lastViewInCell;

/**
 *  距离Cell底部的偏移量
 */
@property (nonatomic, assign) CGFloat wfz_bottomOffsetToCell;

/**
 *  计算Cell的高度
 *
 *  @param tableView tableView
 *  @param config    config (配置Cell)
 *
 *  @return height
 */
+(CGFloat)WFZ_tableView:(UITableView *)tableView
                 config:(configBlock)config;



#pragma --mark-- ⬆️ -- 自动计算cell高 ----


/**
 *  表视图单元格 边距 归零0
 */
- (void)setEdgeInsetsZero;




@end
