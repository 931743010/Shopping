//
//  CityTableView.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CityTableView.h"
#import "CityTableViewCell.h"
#import "CitiesModel.h"

@implementation CityTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{

    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
        //创建头视图
        [self _createView];

        //初次进入查询所有数据
        [self filterContentForSearchText:@"" scope:-1];
        
        UINib *nib = [UINib nibWithNibName:@"CityTableViewCell" bundle:[NSBundle mainBundle]];
        [self registerNib:nib forCellReuseIdentifier:@"CityCell"];
    }
    return self;
}

- (void)_createView {

    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 140)];
    
    //搜索框
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.width, 30)];
    _searchBar.searchBarStyle = UISearchBarStyleDefault;
    _searchBar.delegate = self;
    _searchBar.placeholder = @"请输入中文名称或拼音";
    [headView addSubview:_searchBar];
    
    _collectionView = [[CitiesCollectionView alloc] initWithFrame:CGRectMake(0, 30, self.width, 110)];
    [headView addSubview:_collectionView];
    
    self.tableHeaderView = headView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.listFilterArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell" forIndexPath:indexPath];
    
    CitiesModel *model = self.listFilterArray[indexPath.row];
    cell.model = model;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [[NSNotificationCenter defaultCenter] postNotificationName:@"toGetCityID" object:self.listFilterArray[indexPath.row]];
    
    [self.viewController.navigationController popViewControllerAnimated:YES];
   
}

- (void)filterContentForSearchText:(NSString *)searchText scope:(NSUInteger)scope {
    
    if (searchText.length == 0) {
        
        self.listFilterArray = [NSMutableArray arrayWithArray:self.cityArray];
        //查询所有
        return;
    }
    
    NSPredicate *scopePredicate;
    NSArray *tempArray;
    
    switch (scope) {
        case 0: //英文
            scopePredicate = [NSPredicate predicateWithFormat:@"SELF.city_pinyin contains[c] %@",searchText];
            tempArray = [self.cityArray filteredArrayUsingPredicate:scopePredicate];
            self.listFilterArray = [NSMutableArray arrayWithArray:tempArray];
            break;
        case 1: //中文
            scopePredicate = [NSPredicate predicateWithFormat:@"SELF.city_name contains[c] %@",searchText];
            tempArray = [self.cityArray filteredArrayUsingPredicate:scopePredicate];
            self.listFilterArray = [NSMutableArray arrayWithArray:tempArray];
            break;
            
        default:
            //查询所有
            self.listFilterArray = [NSMutableArray arrayWithArray:self.cityArray];
            break;
    }
    
}

#pragma mark - UISearchBar 代理协议
//获得焦点 成为第一响应者
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    _searchBar.showsScopeBar = TRUE;
    return YES;
}

//点击键盘上的搜索按钮
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [_searchBar resignFirstResponder];
}

//点击搜索栏取消按钮
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [self filterContentForSearchText:_searchBar.text scope:-1];
    [_searchBar resignFirstResponder];
}

//当文本内容改变时调用
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    [self filterContentForSearchText:_searchBar.text scope:_searchBar.selectedScopeButtonIndex];
    [self reloadData];
}

//当搜索范围选择发生变化时调用
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
    
    [self filterContentForSearchText:_searchBar.text scope:selectedScope];
    [self reloadData];
}

@end
