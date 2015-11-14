//
//  HomeViewController.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import "GoodShopViewController.h"
#import "CitiesModel.h"

@interface HomeViewController : BaseViewController

//头视图数据
@property(nonatomic,strong)NSArray *listArray;
@property(nonatomic,strong)NSDictionary *special;

@end
