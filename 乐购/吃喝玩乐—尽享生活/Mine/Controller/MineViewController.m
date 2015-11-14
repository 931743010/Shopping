//
//  MineViewController.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MineViewController.h"
#import "MineHeadView.h"
#import "WebViewController.h"

@interface MineViewController () {
    
    NSArray *_imageArray;
    NSArray *_namesArray;
}

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    MineHeadView *head = [[[NSBundle mainBundle] loadNibNamed:@"MineHeadView" owner:self options:nil] lastObject];
    self.tableView.tableHeaderView = head;
    
    _imageArray = @[@"mine_credits.png",
                    @"mine_money.png",
                    @"mine_promotion.png",
                    @"mine_voucher.png"];
    
    _namesArray = @[@"积分",
                    @"余额(充值卡充值)",
                    @"促销卷",
                    @"抵用卷"];
    
    //设置导航栏右边按钮
    [self rightNavBarButton];
    
    
}

//设置导航栏右边按钮
- (void)rightNavBarButton {
    
    UIButton *rightBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 26, 26)];
    [rightBtn1 setImage:[UIImage imageNamed:@"icon_nav_cart_normal.png"] forState:UIControlStateNormal];
    [rightBtn1 addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right1 = [[UIBarButtonItem alloc] initWithCustomView:rightBtn1];
    
    
    UIButton *rightBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 26, 26)];
    [rightBtn2 setImage:[UIImage imageNamed:@"mine_notification.png"] forState:UIControlStateNormal];
    [rightBtn2 addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right2 = [[UIBarButtonItem alloc] initWithCustomView:rightBtn2];
    
    self.navigationItem.rightBarButtonItems = @[right2,right1];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1)
    {
        
        return 1;
    } else if (section == 2)
    {
        
        return 4;
    }
    else {
        
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MineCell"];
    }
    
    UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:100];
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:101];
    if (indexPath.section == 0) {
        
        imageView.image = [UIImage imageNamed:@"mine_order.png"];
        label.text = @"订单";
        
    }
    else if (indexPath.section == 1)
    {
        imageView.image = [UIImage imageNamed:@"mine_vip.png"];
        label.text = @"VIP会员";
        
    }
    else if (indexPath.section == 2)
    {
        imageView.image = [UIImage imageNamed:_imageArray[indexPath.row]];
        label.text = _namesArray[indexPath.row];
        
    }
    else {
        
        imageView.image = [UIImage imageNamed:@"mine_setting.png"];
        label.text = @"设置";
    }
    
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 40;
}

- (void)rightButtonAction {

    WebViewController *webVC = [[WebViewController alloc] init];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
