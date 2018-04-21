//
//  UITableView+WFZ_Extension.h
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (WFZ_Extension)

#pragma --mark-- ⬇️ -- 用于 自动计算cell高 ---
/**
 *  用于 获取Cell的行高,只需要一个就够了
 */
@property (nonatomic, strong, readonly) NSMutableDictionary *wfz_reuseCells;
#pragma --mark-- ⬇️ -- 用于 自动计算cell高 ---


/**
 *  表视图 边距 归零0
 */
- (void)UIEdgeInsetsZero;



@end
