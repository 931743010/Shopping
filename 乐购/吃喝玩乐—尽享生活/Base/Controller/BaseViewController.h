//
//  BaseViewController.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

//设置导航栏右边按钮
- (void)rightNavBarButton:(NSString *)imageName;
- (void)leftNavBackButtonAction;

//加载提示
- (void)showHUD:(NSString *)title;
- (void)hideHUD;
- (void)completeHUD:(NSString *)title;

@end
