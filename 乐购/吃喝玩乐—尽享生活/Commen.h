//
//  Commen.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#ifndef __________Commen_h
#define __________Commen_h


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "UIImageView+WebCache.h"
#import "MyNetWorkQuery.h"
#import "MBProgressHUD.h"
#import "MJRefresh.h"
#import "UIViewExt.h"
#import "UIView+UIViewController.h"
#import "UIImage+WaterImage.h"
#import "AFNetworking.h"
#import "BaseLabel.h"

//商户下团单列表
#define Shopdeals @"shopdeals"
//商户详情接口
#define Shopinfo @"shopinfo"
//团单详情接口
#define Dealdetail @"dealdetail"
//团单城市接口
#define Cities @"cities"
//团单行政区接口
#define Districts @"districts"
//团单分类信息
#define Categories @"categories"
//根据团单id查询相应的商户
#define Dealshops @"dealshops"
//根据查询条件获取相应团单
#define Searchdeals @"searchdeals"
//根据查询条件获取查询的商户信息
#define Searchshops @"searchshops"

//用户所在位置的经纬度
#define Location @"120.368069,30.326943"


#define kVersion [[UIDevice currentDevice].systemVersion doubleValue]

#endif
