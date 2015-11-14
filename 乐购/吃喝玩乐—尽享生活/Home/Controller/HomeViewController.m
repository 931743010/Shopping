//
//  HomeViewController.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "HomeViewController.h"
#import "MyNetWorkQuery.h"
#import "ShopModel.h"
#import "DealsModel.h"
#import "CitiesViewController.h"
#import "HomeMainTableView.h"
#import "HomeCollectionView.h"
#import "HeadScrollView.h"
#import "BlockModel.h"
#import "GoodShopView.h"

@interface HomeViewController () <UIScrollViewDelegate> {
    
    MBProgressHUD *_hud;
    
    HomeCollectionView *_collectionView;
    HomeMainTableView *_mainTableView;
    UIScrollView *_topScrollView;
    UIPageControl *_pageC;
    UIView *_headView;
    GoodShopView *_goodShopCV;
    NSMutableArray *_dealsModelArray;

    NSArray *_cityArray;
    UIButton *_button; //城市选择按钮
}

@end

@implementation HomeViewController

//移除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置导航栏右边按钮
    [self rightNavBarButton:@"icon_nav_saoyisao_normal.png"];
    
    //城市选择按钮
    [self _selectedCity];
    
    //创建视图
    [self _createViews];
    
    //加载数据  首次启动默认加载杭州市的数据
    [self _loadHomeData:@600010000];
    
    //加载八大金刚模块数据
    [self _loadEightData];
    
    //加载好店推荐部分数据  首次启动默认加载杭州市的数据
    [self _loadGoodShopData:@600010000];
    
    //添加观察者，监听CityTableView里单元格选中事件后传来的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityNotification:) name:@"toGetCityID" object:nil];
    
//    [self showHUD:@"努力加载中..."];
    
}

//通知的方法
- (void)cityNotification:(NSNotification *)notification {
    
    CitiesModel *model = notification.object;
    
    [_button setTitle:model.city_name forState:UIControlStateNormal];
    
    [self _loadHomeData:model.city_id];
}

//接收到通知后重新加载网络
- (void)_loadHomeData:(NSNumber *)cityID {
    
    //接收到通知后重新加载好店推荐部分数据
    [self _loadGoodShopData:cityID];

    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:cityID forKey:@"city_id"];
    
    NSInteger cityid = [cityID integerValue];
    if (cityid == 600010000) {
        
        [params setObject:Location forKey:@"location"];
        [params setObject:@"30000" forKey:@"radius"];
    }
    [params setObject:@20 forKey:@"page_size"];
    
    [MyNetWorkQuery AFRequestData:Searchdeals HTTPMethod:@"GET" params:params completionHandle:^(id result) {
        
        NSDictionary *dealDic = [result objectForKey:@"data"];
        NSArray *deal = [dealDic objectForKey:@"deals"];
        
        NSMutableArray *dataArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dataDic in deal) {
            
            DealsModel *model = [[DealsModel alloc] initWithDataDic:dataDic];
            [dataArray addObject:model];
            
        }
        _mainTableView.dataArray = dataArray;
        [_mainTableView reloadData];
        
        [self completeHUD:@"加载完成"];
        
    } errorHandle:^(NSError *error) {
        
    }];
    
}

//接收到通知后重新加载好店推荐部分数据
- (void)_loadGoodShopData:(NSNumber *)cityID {

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:cityID forKey:@"city_id"];
    
    NSInteger cityid = [cityID integerValue];
    if (cityid == 600010000) {
        
        [params setObject:@"1019" forKey:@"bizarea_ids"];
        [params setObject:@"120.368069,30.326943" forKey:@"location"];
        [params setObject:@"3000" forKey:@"radius"];
    }
    [params setObject:@"4" forKey:@"sort"];
    [params setObject:@"20" forKey:@"page_size"];
    
    [MyNetWorkQuery AFRequestData:Searchdeals HTTPMethod:@"GET" params:params completionHandle:^(id result) {
        
        if (result != nil) {
            
            NSDictionary *dataDic = [result objectForKey:@"data"];
            NSArray *dealsArray = [dataDic objectForKey:@"deals"];
            
            _dealsModelArray = [[NSMutableArray alloc] init];
            for (NSDictionary *dic in dealsArray) {
                
                DealsModel *model = [[DealsModel alloc] initWithDataDic:dic];
                [_dealsModelArray addObject:model];
                
            }
            
            _goodShopCV.goodShopArray = _dealsModelArray;
            [_goodShopCV reloadData];
        }
        
        
    } errorHandle:^(NSError *error) {
        NSLog(@"获取好店推荐部分数据出错");
    }];
}

//创建视图
- (void)_createViews {
    
    //表视图的头视图
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth, 521)];
    _headView.backgroundColor = [UIColor whiteColor];
    
    //主页顶部的滚动视图
    HeadScrollView *scrollView = [[HeadScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 66)];
    [_headView addSubview:scrollView];
    
    //主页的表视图
    _mainTableView = [[HomeMainTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_mainTableView];
    
    //八大视图的集合视图
    _collectionView = [[HomeCollectionView alloc] initWithFrame:CGRectMake(0, 66, [UIScreen mainScreen].bounds.size.width, 325)];
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_headView addSubview:_collectionView];
    
    //好店推荐部分的label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 396, 100, 20)];
    label.text = @"好店推荐";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor darkGrayColor];
    [_headView addSubview:label];
    
    //好店推荐部分的更多按钮
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - 55, 396, 50, 20)];
    [button setTitle:@"更多" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleLabel.textColor = [UIColor darkGrayColor];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goodShopButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:button];
    
    //好店推荐部分的集合视图
    _goodShopCV = [[GoodShopView alloc] initWithFrame:CGRectMake(0, 416, kScreenWidth, 130)];
    [_headView addSubview:_goodShopCV];
    
    _mainTableView.tableHeaderView = _headView;
    
}


//加载八大金刚模块数据
- (void)_loadEightData {

    NSString *urlStr = @"http://app.nuomi.com/naserver/home/homepage";
    NSString *httpArg = @"page_type=component&appid=android&tn=android&terminal_type=android&device=Xiaomi+2014812&channel=1006900a&v=5.13.2&os=SDK19&cityid=600010000&location=30.32402%2C120.350529&cuid=F0DF94CD7CC07BDF0FA191ACA26AAF4E%7C079304320240668&uuid=ffffffff-cd9e-be17-3c1d-5697050e83f7&timestamp=1445150363930&swidth=720&sheight=1280&net=wifi&sign=c052d0c41b66217ec95c509f25683cc4";
    
    [MyNetWorkQuery requestData:urlStr HTTPMethod:@"GET" httpArg:httpArg completionHandle:^(id result) {
        
        NSDictionary *dataDic = [result objectForKey:@"data"];
        _special = [dataDic objectForKey:@"special"];
        
        NSDictionary *specialOneDic = [_special objectForKey:@"block_1"];
        NSArray *spBlockTwo = [_special objectForKey:@"block_2"];
        NSMutableArray *twoArray = [NSMutableArray array];
        for (NSDictionary *twoDic in spBlockTwo) {
            
            BlockModel *twoModel = [[BlockModel alloc] initWithDataDic:twoDic];
            [twoArray addObject:twoModel];
        }
        
        NSArray *spBlockThree = [_special objectForKey:@"block_3"];
        NSMutableArray *threeArray = [NSMutableArray array];
        for (NSDictionary *threeDic in spBlockThree) {
            
            BlockModel *threeModel = [[BlockModel alloc] initWithDataDic:threeDic];
            [threeArray addObject:threeModel];
        }
        
        _collectionView.blockOneDic = specialOneDic;
        _collectionView.blockTwoArray = twoArray;
        _collectionView.blockThreeArray = threeArray;
        [_collectionView reloadData];
        
    } errorHandle:^(NSError *error) {
        NSLog(@"八大金刚数据加载出错");
    }];
}

//城市选择按钮
- (void)_selectedCity {

    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(0, 0, 80, 20);
    [_button setImage:[UIImage imageNamed:@"home_arrow_down_red.png"] forState:UIControlStateNormal];
    [_button setTitle:@"杭州市" forState:UIControlStateNormal];
    _button.titleLabel.font = [UIFont systemFontOfSize:14];
    [_button setTitleColor:[UIColor colorWithRed:250/255.0 green:39/255.0 blue:92/255.0 alpha:1] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(citiesSelected) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *cityButton = [[UIBarButtonItem alloc] initWithCustomView:_button];
    self.navigationItem.leftBarButtonItem = cityButton;
}

- (void)citiesSelected {
    
    CitiesViewController *citiesVC = [[CitiesViewController alloc] init];
    
    [self.navigationController pushViewController:citiesVC animated:YES];
}

//好店推荐部分更多按钮的方法
- (void)goodShopButtonAction {

    GoodShopViewController *goodShopVC = [[GoodShopViewController alloc] init];
    goodShopVC.shopArray = _dealsModelArray;
    [self.navigationController pushViewController:goodShopVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
