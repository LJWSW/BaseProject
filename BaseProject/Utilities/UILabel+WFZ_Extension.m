//
//  UILabel+WFZ_Extension.m
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import "UILabel+WFZ_Extension.h"

@implementation UILabel (WFZ_Extension)

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
             numberOfLines:(NSInteger)numberOfLines
{
    
    __autoreleasing UILabel *label = [[UILabel alloc] init];
    
    label.frame         = rect;
    label.text          = text;
    label.textColor     = textColor;
    label.font          = [UIFont systemFontOfSize:fontSize];
    label.textAlignment = textAlignment;
    label.numberOfLines = numberOfLines;
    
    return label;
}


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
               maxSize:(CGSize)maxSize
{
    
    //文本绘制时的附加选项。 有四种类型：
    //NSStringDrawingTruncatesLastVisibleLine  //如果文本内容超出指定的矩形限制，文本将被截去并在最后一个字符后加上省略号。
    //NSStringDrawingUsesLineFragmentOrigin    //则该选项被忽略 文本将以每行组成的矩形为单位计算整个文本的尺寸
    //NSStringDrawingUsesFontLeading           //计算行高时使用行间距。（译者注：字体大小+行间距=行高）
    //NSStringDrawingUsesDeviceMetrics         //计算布局时使用图元字形（而不是印刷字体）。 计算文本尺寸时将以每个字或字形为单位来计算。
    //通常使用NSStringDrawingUsesLineFragmentOrigin，如果options参数为NSStringDrawingUsesLineFragmentOrigin，那么整个文本将以每行组成的矩形为单位计算整个文本的尺寸。
    
    return [text length] > 0
    ? [text boundingRectWithSize:maxSize
                         options:NSStringDrawingUsesLineFragmentOrigin
                      attributes:@{
                                   NSFontAttributeName : font
                                   } context:nil].size
    : CGSizeZero;
}

/**
 *  计算 文本 范围
 *
 *  @param font    font
 *  @param maxSize maxSize  CGSizeMake(width,0) 为0则认为无限大
 *
 *  @return size
 */
- (CGSize)sizeWithFont:(UIFont *)font
               maxSize:(CGSize)maxSize
{
    
    return [UILabel sizeWithText:self.text font:font maxSize:maxSize];
}


@end
