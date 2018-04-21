//
//  ImageScrollView.m
//  Ios_HYCom_Demo
//
//  Created by 姚碧波 on 15/8/15.
//  Copyright (c) 2015年 BourneYao. All rights reserved.
//

#import "HYImageScrollView.h"
#import "UIImageView+XFSDWebImage.h"

@implementation HYImageScrollView
{
    int _iCount;
    NSTimer *_timer;
    UIScrollView   *_scrollView;
    NSInteger       _currentPage;
}

- (UIView *)initWithFrame:(CGRect)frame marrImages:(NSMutableArray *)marrImages
{
    _iCount = (int)marrImages.count;
    
    _marrImageList = [[NSMutableArray alloc]init];
    _marrImageList = marrImages;
    
    self.frame = frame;
    
    if(self = [super initWithFrame:frame])
    {
        _scrollView               = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _scrollView.delegate      = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces       = YES;
        _scrollView.contentSize   = CGSizeMake([UIScreen mainScreen].bounds.size.width*(marrImages.count+2), frame.size.height);
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scrollView];
        
        [self setMarrImageList:marrImages];
    }
    
    return self;
}

- (void)setBNeedStopScrollWithOnePic:(BOOL)bNeedStopScrollWithOnePic
{
    _bNeedStopScrollWithOnePic = bNeedStopScrollWithOnePic;
    [self setMarrImageList:_marrImageList];
}

- (void)setMarrImageList:(NSMutableArray *)marrImageList
{
    [_scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_pageControl removeFromSuperview];
    _marrImageList = marrImageList;
    _iCount = (int)_marrImageList.count;
    _scrollView.contentSize   = CGSizeMake([UIScreen mainScreen].bounds.size.width, self.frame.size.height);
    
    if (marrImageList.count == 0)
    {
        return;
    }
   
    //第一张图片 使用最后一张
    NSString *strlastlyPicture = [marrImageList objectAtIndex:marrImageList.count-1];
    UIImageView *imgView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width,self.frame.size.height )];
    imgView1.contentMode = UIViewContentModeScaleAspectFill;
    imgView1.clipsToBounds = YES;
    
    [imgView1 sd_setImageWithURL:[NSURL URLWithString:strlastlyPicture] placeholderImage:[UIImage imageNamed:strlastlyPicture]];
    
    imgView1.userInteractionEnabled = YES;
    [imgView1 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ImageScrollUserClicked:)]];
    [_scrollView addSubview:imgView1];
    
    if (!_bNeedStopScrollWithOnePic || _marrImageList.count > 1)
    {
        _scrollView.contentSize   = CGSizeMake([UIScreen mainScreen].bounds.size.width*(marrImageList.count+2), self.frame.size.height);
        //最后一张图片 使用第一张
        NSString *strFirstPicture = [marrImageList objectAtIndex:0];
        
        UIImageView *imgvw2 = [[UIImageView alloc]initWithFrame:CGRectMake((marrImageList.count+1)*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        imgvw2.contentMode = UIViewContentModeScaleAspectFill;
        imgvw2.clipsToBounds = YES;
        
        [imgvw2 sd_setImageWithURL:[NSURL URLWithString:strFirstPicture] placeholderImage:[UIImage imageNamed:strFirstPicture]];
        
        [imgvw2 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ImageScrollUserClicked:)]];
        imgvw2.userInteractionEnabled = YES;
        [_scrollView addSubview:imgvw2];
    
    
        //第二张图片开始是正式的图片数组
        for (int i = 0; i < marrImageList.count; i++)
        {
            NSString *strPicture = [marrImageList objectAtIndex:i];
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake((i+1)*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
            imgView.contentMode = UIViewContentModeScaleAspectFill;
            imgView.clipsToBounds = YES;
            
            [imgView sd_setImageWithURL:[NSURL URLWithString:strPicture] placeholderImage:[UIImage imageNamed:strPicture]];
            
            [imgView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ImageScrollUserClicked:)]];
            imgView.userInteractionEnabled = YES;
            [_scrollView addSubview:imgView];
        }
        
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.frame.size.height-20, self.frame.size.width, 20)];
        _pageControl.numberOfPages = marrImageList.count;
        [_pageControl addTarget:self action:@selector(turnPage) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_pageControl];
        
        [self startScroll];
        [_scrollView scrollRectToVisible:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height) animated:NO];
    }
}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    _currentPage = floor((_scrollView.contentOffset.x-self.frame.size.width)/self.frame.size.width);
    _pageControl.currentPage = _currentPage;
    
    if (_currentPage == -1)
    {
        [_scrollView scrollRectToVisible:CGRectMake(self.frame.size.width*_iCount, 0, self.frame.size.width, self.frame.size.height) animated:NO];
        _pageControl.currentPage = _iCount-1;
    }
    else if (_currentPage == _iCount)
    {
        [_scrollView scrollRectToVisible:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height) animated:NO];
        _pageControl.currentPage = 0;
    }
    
    [_delegate didScrollAtPage:_pageControl.currentPage];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _currentPage = floor((_scrollView.contentOffset.x-self.frame.size.width)/self.frame.size.width);
    _pageControl.currentPage = _currentPage;
    
    if (_currentPage == -1)
    {
        [_scrollView scrollRectToVisible:CGRectMake(self.frame.size.width*_iCount, 0, self.frame.size.width, self.frame.size.height) animated:NO];
        _pageControl.currentPage = _iCount-1;
    }
    else if (_currentPage == _iCount)
    {
        [_scrollView scrollRectToVisible:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height) animated:NO];
        _pageControl.currentPage = 0;
    }
    
    [_delegate didScrollAtPage:_pageControl.currentPage];
}

//开始滚动
- (void)startScroll
{
    if (_timer == nil)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(imageRun) userInfo:nil repeats:YES];
    }
}

- (void)stopScroll
{
    [_timer invalidate];
    _timer = nil;
}

//选择器的方法
- (void)turnPage
{
    [_scrollView scrollRectToVisible:CGRectMake(self.frame.size.width*(_currentPage+1),0,self.frame.size.width,self.frame.size.height) animated:YES];
}

//图片自动轮播功能
- (void)imageRun
{
    _currentPage = floor((_scrollView.contentOffset.x-self.frame.size.width)/self.frame.size.width);
    _currentPage++;
    [self turnPage];
}

//拖拽时停止滚动，3秒后继续滚动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{
    if (!_bNotNeedScroll)
    {
        [_timer invalidate];
        _timer = nil;
        [self performSelector:@selector(startScroll) withObject:nil afterDelay:3.0];
    }
}

//单击
-(void)ImageScrollUserClicked:(UITapGestureRecognizer  *)sender
{
    if (_currentPage == -1)
    {
        if (_bNeedImageScroll)
        {
            [_delegate ImageScroll:self UserClickedAtPage:_marrImageList.count - 1 WithTapper:sender];
            return;
        }
        [_delegate ImageScrollUserClickedAtPage:_marrImageList.count - 1];
        return;
    }
    
    if (_currentPage == _marrImageList.count)
    {
        if (_bNeedImageScroll)
        {
            [_delegate ImageScroll:self UserClickedAtPage:0 WithTapper:sender];
            return;
        }
        [_delegate ImageScrollUserClickedAtPage:0];
        return;
    }
    
    if (_bNeedImageScroll)
    {
        [_delegate ImageScroll:self UserClickedAtPage:_currentPage WithTapper:sender];
        return;
    }
    [_delegate ImageScrollUserClickedAtPage:_currentPage];
}

@end
