//
//  NSObject+WFZ_Gesture.m
//  BaseProject
//
//  Created by 吴福增 on 2016/12/30.
//  Copyright © 2016年 wufuzeng. All rights reserved.
//

/**
 *  需求：
 *
 *  一个父视图为ScrollView 包含一个TableView和一个C0llectionView
 *  tabaleView 在上 collectionView在下
 *  
 *  默认：
 *  scrollView.scrollEnabel = NO;tableView.scrollEnabel = YES;collectionView.scrollEnablle = NO;
 *
 *  当tableView bottom 出现时，
 *  scrollView.scrollEnabel = YES;tableView.scrollEnabel = NO;collectionView.scrollEnablle = NO;
 *  
 *  当collectionView top 消失时：
 *  scrollView.scrollEnabel = NO;tableView.scrollEnabel = NO;collectionView.scrollEnablle = YES;
 *
 *   尝试：KVO 指定点 在当前界面坐标系中的位置
 */



#import "NSObject+WFZ_Gesture.h"

@implementation NSObject (WFZ_Gesture)

#pragma mark -解决 滚动视图 手势 冲突 问题-


//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    // iOS横向滚动的scrollView和系统pop手势返回冲突的解决办法:     http://blog.csdn.net/hjaycee/article/details/49279951
//
//    // 兼容系统pop手势 / FDFullscreenPopGesture / 如有自定义手势，需自行在此处判断
//    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UITableView")]) {
//        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.contentOffset.y == 0) {
//            return YES;
//        }
//    }
//
//    // ReSideMenu 及其他一些手势的开启，需要在这自行此有些。目前还没完全兼容好，会引起一个小问题
//    //    if (self.otherGestureRecognizerSimultaneously) {
//    //        // 再判断系统手势的state是began还是fail，同时判断scrollView的位置是不是正好在最左边
//    //        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.contentOffset.x == 0) {
//    //            return YES;
//    //        }
//    //    }
//    return NO;
//}



//在parentClass(继承自UIView)中：
//[self addGestureRecognizer:_tapGesture]; // _tapGesture is UITapGestureRecognizer, with delegate on parentClass
//在someClass中：
//[_myImageView addGestureRecognizer:_imageViewGestureRecognizer]; // _imageViewGestureRecognizer is UITapGestureRecognizer, with delegate on someClass
//问题：我每次点击ImageView时，两个手势都会被触发。我只要_imageViewGestureRecognizer 触发。
//试过：
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)recognizer shouldReceiveTouch:(UITouch *)touch {
//    UIView *gestureView = recognizer.view;
//    CGPoint point = [touch locationInView:gestureView];
//    UIView *touchedView = [gestureView hitTest:point withEvent:nil];
//    if ([touchedView isEqual:_imageViewGestureRecognizer]) {
//        return NO;
//    }
//
//    return YES;
//}




//IOS 使用自定义手势屏蔽按钮解决方法/UITapGestureRecognizer屏蔽Button
//0、有时候需要在scrollview上面添加手势，让其获取点击后，收起键盘，就用到添加手势。可是会出现一些后续问题，比如会拦截scrollview上面的其他一切可点击的控件，你可能会去设置手势控件的一些属性。但仅仅设置 UIGestureRecognizer 的属性是不够的，比如 ：
//
//
//screenTouch.numberOfTapsRequired =1;
//[screenTouchsetCancelsTouchesInView:NO];
//这种有时候会拦截UITextField上面的清空text的按钮。这时候就需要下面这种方法，从根本上处理好手势响应事件方法。
//
//1、在.h
//头文件中添加<UIGestureRecognizerDelegate>委托
//
//2、在.m体文件中添加实现方法————
//
//// 当一个事件判定为是一个手势时，先进入手势代理方法。该方法中判断点击的视图是不是button如果是button则返回NO，手势不响应该事件，既然没响应，也不会取消该事件的传递。则button会接收到该事件，并作处理。
//
//#pragma mark - UIGestureRecognizerDelegate


//  解决 滚动视图中 子视图 添加手势 不响应 问题
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//    // 判断是不是UIButton的类
//    if ([touch.view isKindOfClass:[UIButton class]])
//    {
//        return NO;
//    }
//    else
//    {
//        return YES;
//    }
//}
//3、经过这么一次折腾，最大的感受就是，凡事都有解决的办法，不要轻易放弃，要多搜网络资源。
//
//


//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    return YES;
//}




@end
