//
//  NSString+getAreaName.m
//  CottonYarn
//
//  Created by 蒋旭峰 on 17/8/9.
//  Copyright © 2017年 蒋旭峰. All rights reserved.
//

#import "NSString+getAreaName.h"

@implementation NSString (getAreaName)

- (NSString *)getProvinceName
{
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"QCProvince" ofType:@"plist"];

    NSArray *arrProvince = [NSArray arrayWithContentsOfFile:strPath];
    
    NSString *strName = @"";
    
    for (NSDictionary *dic in arrProvince)
    {
        if ([dic[@"provinceid"] isEqualToString:self])
        {
            strName = dic[@"provincename"];
            break;
        }
    }
    
    return strName;
}


- (NSString *)getCityName
{
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"QCCity" ofType:@"plist"];
    
    NSArray *arrCity = [NSArray arrayWithContentsOfFile:strPath];
    
    NSString *strName = @"";
    
    for (NSDictionary *dic in arrCity)
    {
        if ([dic[@"cityid"] isEqualToString:self])
        {
            strName = dic[@"cityname"];
            break;
        }
    }
    
    return strName;

}

- (NSString *)getRegionName
{
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"QCRegion" ofType:@"plist"];
    
    NSArray *arrRegion = [NSArray arrayWithContentsOfFile:strPath];
    
    NSString *strName = @"";
    
    for (NSDictionary *dic in arrRegion)
    {
        if ([dic[@"regionid"] isEqualToString:self])
        {
            strName = dic[@"regionname"];
            break;
        }
    }
    
    return strName;

}

@end
