//
//  NSString+WFZ_Extension.m
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import "NSString+WFZ_Extension.h"

@implementation NSString (WFZ_Extension)

#pragma --mark-- ⬇️ -- ----


#pragma --mark-- ⬆️ -- ----

#pragma --mark-- ⬇️ -- ----






/**
 *  判断内容是否全部为空格
 */
+ (BOOL)isEmpty:(NSString *)str
{
    
    if (!str)
    {
        return true;
    }
    else
    {
        //只包含空格字符的字符集空间(U + 0020)和选项卡(U + 0009)和换行符和nextline字符(U + 000 U + 000 d,U + 0085)。
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        //返回一个新的字符串从接收机的两端通过删除字符中包含一个给定的字符集。
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}


/**
 *  判断字符串是否不为空 包括(' ',nil,null)
 *
 *  @return 如果不是(' ',nil,null)返回YES
 */
-(BOOL)isNotNilString
{
    if(
       self != nil &&
       ![self isEqual:[NSNull null]] &&
       self.length != 0 &&
       ![[self lowercaseString] isEqualToString:@"(null)"]
       )
    {
        return YES;
    }
    return NO;
}




#pragma --mark-- ⬆️ -- ----
#pragma --mark-- ⬇️ -- 计算字符串绘制矩形区域大小 ----
/**
 *  计算字符串绘制矩形区域
 *
 *  @param font    字体大小
 *  @param maxSize maxSize // with,height 为0 表示 无穷大
 *
 *  @return size
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName: font};
    //获取字符串内容 绘制 的矩形区域
    CGSize textSize = [self boundingRectWithSize:maxSize
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:dict
                                         context:nil].size;
    return textSize;
}

/**
 *  返回指定显示宽度和字体后字符串 需要 显示的高度
 *
 *
 */

-(CGFloat)heightWithWidth:(CGFloat)width font:(CGFloat)font{
    UIFont * fonts = [UIFont systemFontOfSize:font];
    CGSize size  = CGSizeMake(width, 100000.0);
    NSDictionary * dict  = [NSDictionary dictionaryWithObjectsAndKeys:fonts,NSFontAttributeName ,nil];
    size = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size.height;
}
#pragma --mark-- ⬆️ -- 计算字符串绘制矩形区域大小 ----





#pragma --mark-- ⬇️ -- 计算两个地理位置距离 ----
/**
 *  计算两个地理位置距离
 *
 *  @param lat1 地点1维度
 *  @param lng1 地点1经度
 *  @param lat2 地点2维度
 *  @param lng2 地点2经度
 *
 *  @return 保留1位小数的距离字符串
 */
+(NSString*)distanceBetweenOrderBylat1:(double)lat1 lng1:(double)lng1 lat2:(double)lat2  lng2:(double)lng2{
    
    double dd = M_PI/180;
    double x1=lat1*dd,y1=lng1*dd;
    double x2=lat2*dd,y2=lng2*dd;
    double R = 6371004;
    double distance = (2*R*asin(sqrt(2-2*cos(x1)*cos(x2)*cos(y1-y2) - 2*sin(x1)*sin(x2))/2));
    
    //返回km  distance/1000;（返回100 公里以内）
    return distance/1000<=100?[NSString stringWithFormat:@"%.1lfkm",distance/1000]:@">100km";
    
    //返回m
    //return   distance;
    
}


/**
 *  计算两个地理位置距离
 *
 *  @param lat1Str 地点1维度
 *  @param lng1Str 地点1经度
 *  @param lat2Str 地点2维度
 *  @param lng2Str 地点2经度
 *
 *  @return 保留1位小数的距离字符串
 */
+(NSString*)distanceBetweenOrderBylat1Str:(NSString*)lat1 lng1Str:(NSString*)lng1 lat2Str:(NSString*)lat2  lng2Str:(NSString*)lng2{
    
    double dd = M_PI/180;
    double x1=[lat1 floatValue]*dd,y1=[lng1 floatValue]*dd;
    double x2=[lat2 floatValue]*dd,y2=[lng2 floatValue]*dd;
    double R = 6371004;
    double distance = (2*R*asin(sqrt(2-2*cos(x1)*cos(x2)*cos(y1-y2) - 2*sin(x1)*sin(x2))/2));
    
    //返回km  distance/1000;（返回100 公里以内）
    return distance/1000<=100?[NSString stringWithFormat:@"%.1lfkm",distance/1000]:@">100km";
    
    //返回m
    //return   distance;
    
}

#pragma --mark-- ⬆️ -- 计算两个地理位置距离 ----




#pragma --mark-- ⬇️ -- ----
+ ( NSMutableAttributedString * )HTMLFromString:(NSString *)string{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithData:[ string dataUsingEncoding:NSUnicodeStringEncoding]
                                                                                          options:@{
                                                                                                    NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
                                                                                                    }
                                                                               documentAttributes:nil
                                                                                            error:nil];
    return attributedString;
}
#pragma --mark-- ⬆️ -- ----



/**
 *  隐藏手机号码中间字符
 */
+(NSString*)hiddenPhoneNoMiddleWithStr:(NSString*)str
{
    if (!str) return @"";
    
    return [NSString stringWithFormat:@"%@****%@",[str substringToIndex:str.length>=3?3:0],[str substringFromIndex:str.length>=4?str.length-4:0]];
    
}


/**
 *  隐藏邮箱中间字符
 */
+(NSString*)hiddenEmailMiddleWithStr:(NSString*)str
{
    if (!str) return @"";
    
    NSRange range = [str rangeOfString:@"@"];
    
    if (!range.length)
    {
        return nil;
    }
    
    return [NSString stringWithFormat:@"%@****%@",[str substringToIndex:str.length>=3?3:0],[str substringFromIndex:range.location]];
    
}





/**
 *  生成中划线符文本字符串
 */
+(NSMutableAttributedString*)createDeleteSyleStrWithStr:(NSString*)str font:(UIFont*)font textColor:(UIColor*)color
{
  
    
    //显示 删除线/中划线
    NSDictionary *attribtDic = @{
                                 NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],
                                 NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle),//支持中文 iOS10.3+
                                 NSFontAttributeName:font,
                                 NSForegroundColorAttributeName:color
                                 };
    NSMutableAttributedString *attribtStr =
    [[NSMutableAttributedString alloc]initWithString:str attributes:attribtDic ];;
    
    
    return attribtStr;
}

/**
 *  生成中划线符文本字符串
 */
+(NSMutableAttributedString*)createDeleteSyleStrWithStr:(NSString*)str font:(UIFont*)font textColor:(UIColor*)color deleteLineRange:(NSRange)range
{
    //显示 删除线/中划线
    NSDictionary *attribtDic = @{
                                 NSFontAttributeName:font,
                                 NSForegroundColorAttributeName:color
                                 };
    NSDictionary *attribtDic2 = @{
                                  NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],
                                  NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle),//支持中文 iOS10.3+
                                  };
    NSMutableAttributedString *attribtStr =
    [[NSMutableAttributedString alloc]initWithString:str attributes:attribtDic ];;
    
    [attribtStr setAttributes:attribtDic range:NSMakeRange(0,str.length)];
    
    [attribtStr setAttributes:attribtDic2 range:range];
    
    return attribtStr;
}




@end
