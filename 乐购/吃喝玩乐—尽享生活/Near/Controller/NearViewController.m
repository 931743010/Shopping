//
//  NearViewController.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "NearViewController.h"
#import "ShopCollectionView.h"
#import "WebViewController.h"
#import "NearTableView.h"
#import "DealsModel.h"
#import "ShopModel.h"
#import "ShopMall.h"

@interface NearViewController () {

    NearTableView *_tableView;
    ShopCollectionView *_shopView;
    UILabel *_locLabel;
}

@end

@implementation NearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏右边按钮
    [self rightNavBarButton];
    
    //创建视图
    [self _createViews];
    
    //加载数据
    [self refreshBtnAction];
    
    //加载头部商圈数据
    [self _loadHeadShopMallData];
    
//    [self showHUD:@"努力加载中..."];
}

//创建视图
- (void)_createViews {
    
    //创建顶部视图
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 30)];
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];

    //创建TableView
    _tableView = [[NearTableView alloc] initWithFrame:CGRectMake(0, 94, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    //创建TableView的头视图
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, kScreenWidth, 195)];
    headView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
    
    _locLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 200, 20)];
    _locLabel.text = @"位置";
    _locLabel.font = [UIFont systemFontOfSize:10.0f];
    [headView addSubview:_locLabel];
    
    //刷新按钮
    UIButton *refreshBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - 20, 3, 14, 14)];
    [refreshBtn setImage:[UIImage imageNamed:@"icon_location_reload.png"] forState:UIControlStateNormal];
    [refreshBtn addTarget:self action:@selector(refreshBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:refreshBtn];
    
    UILabel *shopLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, 20)];
    shopLabel.text = @"商场商圈";
    [headView addSubview:shopLabel];
    shopLabel.backgroundColor = [UIColor whiteColor];
    shopLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    shopLabel.font = [UIFont systemFontOfSize:14.0f];
    shopLabel.layer.borderWidth = 1;
    
    //商圈视图
    _shopView = [[ShopCollectionView alloc] initWithFrame:CGRectMake(5, 40, kScreenWidth - 10, 155)];
    [headView addSubview:_shopView];
    _tableView.tableHeaderView = headView;
    
}

//120.368069,30.326943
//加载数据
- (void)_loadData:(NSString *)lonLat {

    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@"600010000" forKey:@"city_id"];
    [params setObject:@"120.368069,30.326943" forKey:@"location"];
    [params setObject:@"1000" forKey:@"radius"];
    
    [MyNetWorkQuery AFRequestData:Searchshops HTTPMethod:@"GET" params:params completionHandle:^(id result) {
        
        NSDictionary *dataDic = [result objectForKey:@"data"];
        NSArray *shopsArray = [dataDic objectForKey:@"shops"];
        
        NSMutableArray *dealsArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in shopsArray) {
            
            NSArray *deal = [dic objectForKey:@"deals"];
            for (NSDictionary *dealDic in deal) {
                
                DealsModel *model = [[DealsModel alloc] initWithDataDic:dealDic];
                
                [dealsArray addObject:model];
            }
            
        }
        
        _tableView.shopsArray = shopsArray;
        _tableView.dealsArray = dealsArray;
        [_tableView reloadData];
        
//        [self completeHUD:@"加载完成"];
        
    } errorHandle:^(NSError *error) {
        NSLog(@"获取附近推荐出错");
        
    }];
    
}

//加载头部商圈数据
- (void)_loadHeadShopMallData {
    
    //加载头部商圈数据
    NSString *urlString = @"http://180.97.34.118/naserver/search/shopmall";
    NSString *httpArg = @"locate_city_id=600010000&appid=android&tn=android&terminal_type=android&device=Xiaomi+2014812&channel=1006900a&v=5.13.2&os=SDK19&cityid=600010000&location=30.324115%2C120.350545&cuid=F0DF94CD7CC07BDF0FA191ACA26AAF4E%7C079304320240668&uuid=ffffffff-cd9e-be17-3c1d-5697050e83f7&timestamp=1445764527045&swidth=720&sheight=1280&net=wifi&sign=49feec3da9f2b131e2fde81be7a86ac7";
    
    [MyNetWorkQuery requestData:urlString HTTPMethod:@"GET" httpArg:httpArg completionHandle:^(id result) {
        
        NSDictionary *dataDic = [result objectForKey:@"data"];
        NSArray *shoplistArray = [dataDic objectForKey:@"shoplist"];
        
        NSMutableArray *mallArray = [[NSMutableArray alloc] init];
        for (NSDictionary *listDic in shoplistArray) {
            
            ShopMall *mall = [[ShopMall alloc] initWithDataDic:listDic];
            [mallArray addObject:mall];
            
        }
        _shopView.shopMallArray = mallArray;
        [_shopView reloadData];
        
    } errorHandle:^(NSError *error) {
        NSLog(@"商圈数据加载出错");
    }];

}

#pragma mark - 获取地理位置
//刷新按钮
- (void)refreshBtnAction {
    
    _locLabel.text = @"正在定位";
    
    if (_locationManager == nil) {
        
        _locationManager = [[CLLocationManager alloc] init];
        
        if (kVersion >= 8.0) {
            
            [_locationManager requestWhenInUseAuthorization];
        }
    }
    
    //设置定位精度
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    _locationManager.delegate = self;
    [_locationManager startUpdatingLocation];

}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {

    [_locationManager stopUpdatingLocation];
    
    CLLocation *location = [locations lastObject];
    CLLocationCoordinate2D coordinate = location.coordinate;
    
    //地理位置反编码
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
       
        CLPlacemark *place = [placemarks lastObject];
        
        _locLabel.text = place.name;
        
    }];
    
    NSString *lonLat = [NSString stringWithFormat:@"%f,%f",coordinate.longitude,coordinate.latitude];
    
    [self _loadData:lonLat];
    
}

//设置导航栏按钮
- (void)rightNavBarButton {
    
    UIButton *rightBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 26, 26)];
    [rightBtn1 setImage:[UIImage imageNamed:@"icon_nav_cart_normal.png"] forState:UIControlStateNormal];
    [rightBtn1 addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right1 = [[UIBarButtonItem alloc] initWithCustomView:rightBtn1];
    
    
    UIButton *rightBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 26, 26)];
    [rightBtn2 setImage:[UIImage imageNamed:@"icon_nav_sousuo_normal.png"] forState:UIControlStateNormal];
    [rightBtn2 addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right2 = [[UIBarButtonItem alloc] initWithCustomView:rightBtn2];
    
    self.navigationItem.rightBarButtonItems = @[right2,right1];
    
    //左边按钮
    UIButton *leftbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 26, 26)];
    [leftbtn setImage:[UIImage imageNamed:@"icon_nav_ditu_normal.png"] forState:UIControlStateNormal];
    [leftbtn addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:leftbtn];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)rightButtonAction {

    WebViewController *webVC = [[WebViewController alloc] init];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)leftButtonAction {
    
    NearByViewController *nearByVC = [[NearByViewController alloc] init];
    [self.navigationController pushViewController:nearByVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
