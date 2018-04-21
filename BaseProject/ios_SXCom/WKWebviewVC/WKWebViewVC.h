//
//  WKWebViewVC.h
//  CottonYarn
//
//  Created by 蒋旭峰 on 17/3/18.
//  Copyright © 2017年 蒋旭峰. All rights reserved.
//

#import "BaseExtendVC.h"

#import <WebKit/WebKit.h>

@interface WKWebViewVC : BaseExtendVC

@property (nonatomic, copy) NSString *strUrl;
@property (nonatomic, copy) NSString *strTitle;

@property (nonatomic, strong) WKWebView *webView;

@end
