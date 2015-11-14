//
//  ShopDetailViewController.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ShopDetailViewController.h"

@interface ShopDetailViewController ()

@end

@implementation ShopDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.hidesBottomBarWhenPushed = YES;
        [self leftNavBackButtonAction];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, -45, kScreenWidth, kScreenHeight + 49)];
    [self.view addSubview:web];
    
    NSURL *url = [NSURL URLWithString:_shopURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [web loadRequest:request];
    web.scalesPageToFit = YES;
    
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
