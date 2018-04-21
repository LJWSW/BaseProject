//
//  UITextField+WFZ_Extension.h
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (WFZ_Extension)

/**
 *  类方法添加 UITextField
 *
 *  @param rect          rect
 *  @param text          text
 *  @param placeholder   placeholder
 *  @param textColor     textColor
 *  @param fontSize      fontSize
 *  @param textAlignment textAlignment
 *
 *  @return return UITextField
 */
+ (UITextField *)textFieldWithRect:(CGRect)rect
                              text:(NSString *)text
                       placeholder:(NSString *)placeholder
                         textColor:(UIColor *)textColor
                          fontSize:(CGFloat)fontSize
                     textAlignment:(NSTextAlignment)textAlignment
                      keyboardType:(UIKeyboardType)keyboardType
                     returnKeyType:(UIReturnKeyType)returnKeyType
                   secureTextEntry:(BOOL)secureTextEntry;

- (NSRange) selectedRange;
- (void) setSelectedRange:(NSRange) range;

@end
