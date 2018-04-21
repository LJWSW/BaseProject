//
//  UIScrollView+WFZ_MJRefresh.m
//  BaseProject
//
//  Created by 吴福增 on 2016/12/30.
//  Copyright © 2016年 wufuzeng. All rights reserved.
//

#import "UIScrollView+WFZ_MJRefresh.h"

@implementation UIScrollView (WFZ_MJRefresh)

#pragma mark -- header - --

/** 添加头部刷新 */
- (void)addNormal_HeaderRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock
{
    self.mj_header =[MJRefreshNormalHeader headerWithRefreshingBlock:refreshBlock];
}

/** 开始头部刷新 */
- (void)header_beginRefreshing
{
    [self.mj_header beginRefreshing];
}

/** 结束头部刷新 */
- (void)header_endRefreshing
{
    [self.mj_header endRefreshing];
}


#pragma mark -- footer - --
/** 添加脚部刷新 */
- (void)addNormal_FooterRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock
{
    self.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:refreshBlock];
}
/** 开始脚部刷新 */
- (void)footer_beginRefreshing
{
    [self.mj_footer beginRefreshing];
}
/**
 *  结束脚部刷新
 */
- (void)footer_endRefreshing
{
    [self.mj_footer endRefreshing];
}

/**
 *  结束脚部刷新 没有更多数据
 */
- (void)footer_endRefreshingWithNoMoreData
{
    [self.mj_footer endRefreshingWithNoMoreData];
    
}

/**
 *  重置 尾部没有更多数据
 */
-(void)footer_resetNoMoreData
{
    [self.mj_footer resetNoMoreData];
}



@end
