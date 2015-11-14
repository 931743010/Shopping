//
//  NearTableView.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "NearTableView.h"
#import "NearByViewCell.h"
#import "NearCellHeadViewCell.h"
#import "DealsModel.h"
#import "DealsDetailViewController.h"
#import "ShopDetailViewController.h"

@implementation NearTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{

    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
        UINib *nib = [UINib nibWithNibName:@"NearByViewCell" bundle:[NSBundle mainBundle]];
        [self registerNib:nib forCellReuseIdentifier:@"nearCell"];
        
        UINib *nibHead = [UINib nibWithNibName:@"NearCellHeadViewCell" bundle:[NSBundle mainBundle]];
        [self registerNib:nibHead forCellReuseIdentifier:@"headCell"];
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _shopsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSDictionary *dealDic = _shopsArray[section];
    
    NSInteger num = [dealDic[@"deal_num"] integerValue];
    
    return num + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) { //店名
        
        NearCellHeadViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headCell" forIndexPath:indexPath];
        
        NSDictionary *shopDic = _shopsArray[indexPath.section];
        NSArray *array = shopDic[@"deals"];
        for (NSDictionary *dic in array) {
            
            //评分
            CGFloat score = [dic[@"score"] floatValue];
            cell.scoreLabel.text = [NSString stringWithFormat:@"%.1f分",score];
            if (score == 0) {
                
                cell.scoreLabel.text = @"暂无评分";
            }
        }
        //店名
        cell.shopNameLabel.text = shopDic[@"shop_name"];
        //距离
        CGFloat dt = [shopDic[@"distance"] floatValue];
        cell.distanceLabel.text = [NSString stringWithFormat:@"下沙%.0fm",dt];

        return cell;
        
    } else { //商店下团单列表
        
        NSInteger index = 0;
        if (indexPath.section > 0) {
            
            for (int i = 0; i <= indexPath.section-1; i++) {
                
                NSDictionary *dic = _shopsArray[i];
                NSInteger num = [dic[@"deal_num"] integerValue];
                
                index += num;
            }
        }
        
        NearByViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nearCell" forIndexPath:indexPath];
        
        DealsModel *model = _dealsArray[index + (indexPath.row - 1)];
        cell.model = model;
        
        return cell;
    
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        return 50;
    } else {
    
        return 80;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 15;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {

        ShopDetailViewController *shopDetailVC = [[ShopDetailViewController alloc] init];
        
        NSDictionary *shops = _shopsArray[indexPath.section];
        shopDetailVC.shopURL = shops[@"shop_murl"];
        
        [self.viewController.navigationController pushViewController:shopDetailVC animated:YES];
        
        
    } else {
    
        NSInteger index = 0;
        if (indexPath.section > 0) {
            
            for (int i = 0; i <= indexPath.section-1; i++) {
                
                NSDictionary *dic = _shopsArray[i];
                NSInteger num = [dic[@"deal_num"] integerValue];
                
                index += num;
            }
        }
        
        DealsDetailViewController *dealsDetailVC = [[DealsDetailViewController alloc] init];
        DealsModel *model = _dealsArray[index + (indexPath.row - 1)];
        dealsDetailVC.model = model;
        [self.viewController.navigationController pushViewController:dealsDetailVC animated:YES];
    }
 
    
}

@end
