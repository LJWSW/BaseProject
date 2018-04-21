//
//  UIScrollView+WFZ_MJRefresh.h
//  BaseProject
//
//  Created by 吴福增 on 2016/12/30.
//  Copyright © 2016年 wufuzeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MJRefresh.h>

@interface UIScrollView (WFZ_MJRefresh)

#pragma mark -- header - --

/**
 *  添加头部刷新
 */
- (void)addNormal_HeaderRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock;

/**
 *  开始头部刷新
 */
- (void)header_beginRefreshing;

/**
 *  结束头部刷新
 */
- (void)header_endRefreshing;

#pragma mark -- footer - --

/**
 *  添加脚部刷新
 */
- (void)addNormal_FooterRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock;

/**
 *  开始脚部刷新
 */
- (void)footer_beginRefreshing;

/**
 *  结束脚部刷新
 */
- (void)footer_endRefreshing;

/**
 *  结束脚部刷新 没有更多数据
 */
- (void)footer_endRefreshingWithNoMoreData;

/**
 *  重置 尾部没有更多数据
 */
-(void)footer_resetNoMoreData;

@end
