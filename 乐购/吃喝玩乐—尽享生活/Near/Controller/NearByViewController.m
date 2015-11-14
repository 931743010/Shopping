//
//  NearByViewController.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/29.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "NearByViewController.h"
#import "ShopAnnotation.h"
#import "ShopAnnotationView.h"
#import "ShopModel.h"

@interface NearByViewController () {

    MKMapView *_mapView;
}

@end

@implementation NearByViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.hidesBottomBarWhenPushed = YES;
        [self leftNavBackButtonAction];
        self.title = @"附近商户";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createViews];
}

- (void)_createViews {

    _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    //显示用户位置
    _mapView.showsUserLocation = YES;
    //地图种类
    _mapView.mapType = MKMapTypeStandard;
    
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
}

#pragma mark - mapView 代理
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {

    CLLocation *location = userLocation.location;
    CLLocationCoordinate2D coordinate = location.coordinate;
    
    //设置地图的显示区域
    CLLocationCoordinate2D center = coordinate;
    MKCoordinateSpan span = {0.5,0.5};
    MKCoordinateRegion region = {center,span};
    
    mapView.region = region;
    
    //网络获取附近商店
    NSString *lonLat = [NSString stringWithFormat:@"%f,%f",coordinate.longitude,coordinate.latitude];
    
    [self _loadNearByShop:lonLat];
    
}

//网络获取附近商店
- (void)_loadNearByShop:(NSString *)lonLat {

    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@"600010000" forKey:@"city_id"];
    [params setObject:lonLat forKey:@"location"];
    [params setObject:@"3000" forKey:@"radius"];
    
    [MyNetWorkQuery AFRequestData:Searchshops HTTPMethod:@"GET" params:params completionHandle:^(id result) {
        
        NSDictionary *dataDic = [result objectForKey:@"data"];
        NSArray *array = [dataDic objectForKey:@"shops"];
        
        NSMutableArray *annotationArray = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            
            ShopModel *model = [[ShopModel alloc] initWithDataDic:dic];
            ShopAnnotation *annotation = [[ShopAnnotation alloc] init];
            annotation.model = model;
            [annotationArray addObject:annotation];
        }
        
        [_mapView addAnnotations:annotationArray];
        
    } errorHandle:^(NSError *error) {
        NSLog(@"附近商店获取出错");
    }];
}

//自定义标注视图
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {

    //处理用户当前位置
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        
        return nil;
    }
    
    if ([annotation isKindOfClass:[ShopAnnotation class]]) {
        
        ShopAnnotationView *view = (ShopAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"view"];
        if (view == nil) {
            
            view = [[ShopAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"view"];
        }
        view.annotation = annotation;
        
        [view setNeedsLayout];
        
        return view;
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
