//
//  DealsDetailViewController.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/26.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "DealsDetailViewController.h"

@interface DealsDetailViewController ()

@end

@implementation DealsDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *web = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:web];
    
    NSURL *url = [NSURL URLWithString:_model.deal_murl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [web loadRequest:request];
    web.scalesPageToFit = YES;
    
    //调用导航栏返回按钮方法
    [self leftNavBackButtonAction];
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
