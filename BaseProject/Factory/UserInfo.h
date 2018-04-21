//
//  UserInfo.h
//  HealthStore
//
//  Created by 楼某人 on 2018/1/24.
//  Copyright © 2018年 楼某人. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject
    
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *headPhoto;

@property (nonatomic, assign) BOOL IS_Login;

+ (instancetype)sharedInstance;

/**
 *  解档用户信息
 */
+(instancetype)decodeUserInfo;

/**
 *  保存用户信息
 */
-(void)saveUserInfo;


/**
 *  清空用户信息
 */
-(void)clearUserInfo;


@end
