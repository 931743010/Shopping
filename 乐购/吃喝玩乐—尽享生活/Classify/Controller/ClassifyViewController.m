//
//  ClassifyViewController.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ClassifyViewController.h"
#import "CategoryModel.h"
#import "ChoiceViewController.h"
#import "HomeViewController.h"

@interface ClassifyViewController ()

@end

@implementation ClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //分类数据加载
    [self _loadCategoryData];
    
}


//分类数据加载
- (void)_loadCategoryData {

    NSString *urlStr = @"http://app.nuomi.com/naserver/home/homepage";
    NSString *httpArg = @"page_type=component&appid=android&tn=android&terminal_type=android&device=Xiaomi+2014812&channel=1006900a&v=5.13.2&os=SDK19&cityid=600010000&location=30.32402%2C120.350529&cuid=F0DF94CD7CC07BDF0FA191ACA26AAF4E%7C079304320240668&uuid=ffffffff-cd9e-be17-3c1d-5697050e83f7&timestamp=1445150363930&swidth=720&sheight=1280&net=wifi&sign=c052d0c41b66217ec95c509f25683cc4";
    
    [MyNetWorkQuery requestData:urlStr HTTPMethod:@"GET" httpArg:httpArg completionHandle:^(id result) {
        
        NSDictionary *dealDic = [result objectForKey:@"data"];
        NSArray *deal = [dealDic objectForKey:@"category"];
        
        NSMutableArray *dataArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dataDic in deal) {
            CategoryModel *model = [[CategoryModel alloc] initWithDataDic:dataDic];

            [dataArray addObject:model];
            
        }
        
    } errorHandle:^(NSError *error) {
        NSLog(@"加载数据出错:%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
