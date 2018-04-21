//
//  UITextField+WFZ_Extension.m
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import "UITextField+WFZ_Extension.h"

@implementation UITextField (WFZ_Extension)

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
                   secureTextEntry:(BOOL)secureTextEntry

{
    __autoreleasing UITextField *textField = [[UITextField alloc] init];
    
    textField.frame           = rect;
    textField.text            = text;
    textField.font            = [UIFont systemFontOfSize:fontSize];
    textField.textColor       = textColor;
    textField.placeholder     = placeholder;
    textField.textAlignment   = textAlignment;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.keyboardType    = keyboardType;
    textField.returnKeyType   = returnKeyType;
    textField.secureTextEntry = secureTextEntry;
    
    return textField;
}

- (NSRange) selectedRange
{
    UITextPosition* beginning      = self.beginningOfDocument;
    UITextRange* selectedRange     = self.selectedTextRange;
    UITextPosition* selectionStart = selectedRange.start;
    UITextPosition* selectionEnd   = selectedRange.end;
    
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length   = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}

- (void) setSelectedRange:(NSRange) range
{
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextPosition* startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition* endPosition   = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange* selectionRange   = [self textRangeFromPosition:startPosition toPosition:endPosition];
    
    [self setSelectedTextRange:selectionRange];
}


@end
