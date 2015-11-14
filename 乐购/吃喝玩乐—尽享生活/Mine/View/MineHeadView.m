//
//  MineHeadView.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MineHeadView.h"
#import "WebViewController.h"

@implementation MineHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)loadAction:(UIButton *)sender {
    
    WebViewController *webVC = [[WebViewController alloc] init];
    
    [self.viewController.navigationController pushViewController:webVC animated:YES];
}
@end
