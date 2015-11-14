//
//  WebViewController.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"登录百度账号";
        self.view.backgroundColor = [UIColor lightGrayColor];
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建WebView
    [self _createWebView];
    
    //导航栏返回按钮
    [self leftNavBackButtonAction];

}

//创建WebView
- (void)_createWebView {
    
    UIWebView *webV = [[UIWebView alloc] initWithFrame:CGRectMake(0, -45, kScreenWidth, kScreenHeight+45)];
    [self.view addSubview:webV];
    
    //读取html文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"wappass.baidu.com_passport_login" ofType:@"html"];
    //读取文件数据
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    //加载页面
    [webV loadHTMLString:htmlString baseURL:nil];
    webV.scalesPageToFit = YES;

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
