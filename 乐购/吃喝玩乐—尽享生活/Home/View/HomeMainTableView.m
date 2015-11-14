//
//  TableView.m
//  测试CT
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "HomeMainTableView.h"
#import "HomeViewCell.h"
#import "ShopViewController.h"

@implementation HomeMainTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
        self.backgroundColor = [UIColor clearColor];
        self.backgroundView.alpha = 0;
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeViewCell" owner:self options:nil] lastObject];
    }
    DealsModel *model = _dataArray[indexPath.row];
    cell.model = model;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"猜你喜欢";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 86;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ShopViewController *shopVC = [[ShopViewController alloc] init];
    DealsModel *model = _dataArray[indexPath.row];
    shopVC.model = model;
    
    [self.viewController.navigationController pushViewController:shopVC animated:YES];
    
    [self deselectRowAtIndexPath:indexPath animated:YES];
}

@end
