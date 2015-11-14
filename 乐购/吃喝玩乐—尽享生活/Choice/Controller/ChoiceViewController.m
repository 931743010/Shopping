//
//  ChoiceViewController.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ChoiceViewController.h"
#import "ChoiceModel.h"
#import "ChoiceViewCell.h"
#import "ChoiceDetailViewController.h"

@interface ChoiceViewController ()
@end

@implementation ChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏右边按钮
    [self rightNavBarButton:@"icon_nav_saoyisao_normal.png"];
    
    //加载数据
    [self _loadData];
    
    
}


//加载数据
- (void)_loadData {

//    NSString *urlString = @"http://t10.nuomi.com/webapp/na/toptenajax";
//    NSString *httpArg = @"from=fr_na_t10&tid=t_home_na&bn_v=5.13.2&cuid=F0DF94CD7CC07BDF0FA191ACA26AAF4E%7C079304320240668&location=30.324199%2C120.350697&sid=199%2C172%2C120%2C214%2C83%2C118&areaId=600010000&deviceType=Android&pn=0&pageSize=20&compid=t10brand&comppage=index&needstorecard=1";
    
//    [MyNetWorkQuery requestData:urlString HTTPMethod:@"GET" httpArg:httpArg completionHandle:^(id result) {
//        
//        NSDictionary *dataDic = [result objectForKey:@"data"];
//        
//        NSArray *listArray = [dataDic objectForKey:@"list"];
//        
//        NSMutableArray *array = [[NSMutableArray alloc] init];
//        self.dataArray = [[NSMutableArray alloc] init];
//        
//        for (NSDictionary *dic in listArray) {
//            
//            ChoiceModel *chModel = [[ChoiceModel alloc] initWithDataDic:dic];
//            [array addObject:chModel];
//        }
//
//        self.dataArray = array;        
//        [_tableView reloadData];
//        
//    } errorHandle:^(NSError *error) {
//       
//        NSLog(@"精选获取数据出错");
//    }];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@"600010000" forKey:@"city_id"];
    [params setObject:Location forKey:@"location"];
    [params setObject:@"30000" forKey:@"radius"];
    [params setObject:@"8" forKey:@"sort"];
    [params setObject:@"20" forKey:@"page_size"];
    
    [MyNetWorkQuery AFRequestData:Searchdeals HTTPMethod:@"GET" params:params completionHandle:^(id result) {
        
        NSDictionary *dataDic = [result objectForKey:@"data"];
        NSArray *dealsArray = [dataDic objectForKey:@"deals"];
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        self.dataArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in dealsArray) {
            
            DealsModel *model = [[DealsModel alloc] initWithDataDic:dic];
            
            [array addObject:model];
        }
        
        self.dataArray = array;
        [_tableView reloadData];
        
    } errorHandle:^(NSError *error) {
        NSLog(@"精选品牌数据获取出错");
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    } else {
    
        return _dataArray.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        UITableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
        
        UIImageView *imageView = (UIImageView *)[firstCell.contentView viewWithTag:100];
        imageView.image = [UIImage imageNamed:@"VIPMember.png"];

        
        UILabel *label = (UILabel *)[firstCell.contentView viewWithTag:101];
        label.text = @"下单享立减";
        return firstCell;
        
    }
    else {
        
        ChoiceViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"choiceCell"];
        if (cell == nil) {
            
            cell = [[ChoiceViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"choiceCell"];
        }
        
        cell.model = _dataArray[indexPath.row];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 30;
    }
    else {
        
        return 90;
    }
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.width, 10)];
    if (section == 1) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, tableView.width, 10)];
        label.text = @"没人每天每单累计优惠两份";
        label.font = [UIFont systemFontOfSize:10];
        [view addSubview:label];
    }
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    if (section == 0) {
        return 0;
    } else {
    
        return 10;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        return;
    }
    
    ChoiceDetailViewController *choiceDetailVC = [[ChoiceDetailViewController alloc] init];
    DealsModel *model = _dataArray[indexPath.row];
    choiceDetailVC.model = model;
    
    [self.navigationController pushViewController:choiceDetailVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
