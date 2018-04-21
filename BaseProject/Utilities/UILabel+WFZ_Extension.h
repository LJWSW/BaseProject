//
//  UILabel+WFZ_Extension.h
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WFZ_Extension)

/**
 *  类方法 添加 Label
 *
 *  @param rect          rect
 *  @param text          text
 *  @param textColor     textColor
 *  @param fontSize      fontSize
 *  @param textAlignment textAlignment
 *  @param numberOfLines numberOfLines
 *
 *  @return Label
 */
+ (UILabel *)labelWithRect:(CGRect)rect
                      text:(NSString *)text
                 textColor:(UIColor *)textColor
                  fontSize:(CGFloat)fontSize
             textAlignment:(NSTextAlignment)textAlignment
             numberOfLines:(NSInteger)numberOfLines;


/**
 *  计算 文本 范围
 *
 *  @param text    text
 *  @param font    font
 *  @param maxSize maxSize  CGSizeMake(width,0) 为0则认为无限大
 *
 *  @return size
 */
+ (CGSize)sizeWithText:(NSString *)text
                  font:(UIFont *)font
               maxSize:(CGSize)maxSize;

/**
 *  计算 文本 范围
 *
 *  @param font    font
 *  @param maxSize maxSize  CGSizeMake(width,0) 为0则认为无限大
 *
 *  @return size
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;


@end
