//
//  BaseViewController.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import "HomeViewController.h"
#import "WebViewController.h"

@interface BaseViewController () {

    MBProgressHUD *_hud;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

//设置导航栏右边按钮
- (void)rightNavBarButton:(NSString *)imageName {

    UIButton *rightBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 26, 26)];
    [rightBtn1 setImage:[UIImage imageNamed:@"icon_nav_cart_normal.png"] forState:UIControlStateNormal];
    [rightBtn1 addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right1 = [[UIBarButtonItem alloc] initWithCustomView:rightBtn1];
    

    UIButton *rightBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 26, 26)];
    [rightBtn2 setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    UIBarButtonItem *right2 = [[UIBarButtonItem alloc] initWithCustomView:rightBtn2];
    
    self.navigationItem.rightBarButtonItems = @[right2,right1];
}
//设置导航栏右边按钮方法
- (void)rightButtonAction {

    WebViewController *webVC = [[WebViewController alloc] init];
    [self.navigationController pushViewController:webVC animated:YES];
}

//创建导航栏返回按钮
- (void)leftNavBackButtonAction {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 36);
    [button setImage:[UIImage imageNamed:@"detailViewBackRed.png"] forState:UIControlStateNormal];
    
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:250/255.0 green:39/255.0 blue:92/255.0 alpha:1] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(navButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)navButtonAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)backHomeButtonAction {

    HomeViewController *homeVC = [[HomeViewController alloc] init];
    
    [self.navigationController pushViewController:homeVC animated:YES];
}

//加载提示
- (void)showHUD:(NSString *)title {
    
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_hud show:YES];
    _hud.labelText = title;
    _hud.dimBackground = YES;

}

- (void)hideHUD {
    
    [_hud hide:YES];

}

- (void)completeHUD:(NSString *)title {
    
    _hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    _hud.mode = MBProgressHUDModeCustomView;
    _hud.labelText = title;
    [_hud hide:YES afterDelay:1.5];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
