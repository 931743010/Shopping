//
//  LeftSideViewController.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CitiesViewController.h"
#import "CityTableView.h"
#import "CitiesModel.h"

@interface CitiesViewController () {

    CityTableView *_tableView;
    NSMutableArray *_dataArray;
}

@end

@implementation CitiesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建表视图
    [self _createTableView];
    
    //加载数据
    [self _loadData];
    
    //创建导航栏按钮
    [self _createNavButton];
    
}

//创建表视图
- (void)_createTableView {

    _tableView = [[CityTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
}

//创建导航栏按钮
- (void)_createNavButton {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.text = @"城市选择";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:16];
    self.navigationItem.titleView = label;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 20, 20);
    [button setImage:[UIImage imageNamed:@"icon_nav_fanhui_normal.png"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = backButton;
    
}

- (void)backButtonAction {

    [self.navigationController popViewControllerAnimated:YES];
}

//加载数据
- (void)_loadData {

    [MyNetWorkQuery AFRequestData:Cities HTTPMethod:@"GET" params:nil completionHandle:^(id result) {
        
        if (result != nil) {
            
            NSArray *citiesArray = [result objectForKey:@"cities"];
            
            _dataArray = [[NSMutableArray alloc] init];
            for (NSDictionary *dic in citiesArray) {
                
                CitiesModel *model = [[CitiesModel alloc] initWithDataDic:dic];
                [_dataArray addObject:model];
                
            }
            _tableView.cityArray = _dataArray;
            [_tableView reloadData];

        }
        
    } errorHandle:^(NSError *error) {
        NSLog(@"获取城市列表出错");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
