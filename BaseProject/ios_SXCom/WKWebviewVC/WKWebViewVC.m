//
//  WKWebViewVC.m
//  CottonYarn
//
//  Created by 蒋旭峰 on 17/3/18.
//  Copyright © 2017年 蒋旭峰. All rights reserved.
//

#import "WKWebViewVC.h"

@interface WKWebViewVC ()<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler>

@property (strong, nonatomic) UIProgressView *progressView;

@end

@implementation WKWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];

    // Do any additional setup after loading the view.
}

- (void)initView
{
    
    self.cSuperTitle = (_strTitle) ? _strTitle : @"";
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.preferences.javaScriptEnabled = YES;
    
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, G_SCREEN_WIDTH, G_SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaToBottomHeight)];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    [self.view addSubview:_webView];
    
    _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHeight, CGRectGetWidth(self.view.frame),2)];
    [self.view addSubview:_progressView];
    
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew| NSKeyValueObservingOptionOld context:nil];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_strUrl]]];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@" %s,change = %@",__FUNCTION__,change);
    if ([keyPath isEqual: @"estimatedProgress"] && object == _webView) {
        [self.progressView setAlpha:1.0f];
        [self.progressView setProgress:_webView.estimatedProgress animated:YES];
        if(_webView.estimatedProgress >= 1.0f)
        {
            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.progressView setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0f animated:NO];
            }];
        }
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    self.cSuperTitle = (_strTitle) ? _strTitle : self.webView.title;
}

//在JS端调用alert函数时，会触发此代理方法。
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    
    UIAlertView *alert = [UIAlertView bk_showAlertViewWithTitle:frame.request.URL.absoluteString message:message cancelButtonTitle:@"确定" otherButtonTitles:nil handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
        
    }];
    [alert show];
    
    completionHandler();
}

////JS端调用confirm函数时，会触发此方法
//- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler;

//
////JS端调用prompt函数时，会触发此方法
//- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable result))completionHandler;

- (void)dealloc {
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
    
    // if you have set either WKWebView delegate also set these to nil here
    [_webView setNavigationDelegate:nil];
    [_webView setUIDelegate:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
