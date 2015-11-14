//
//  ShopModel.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ShopModel.h"

@implementation ShopModel

- (NSDictionary *)attributeMapDictionary {

    
    NSDictionary *mapAttr = @{@"shop_id":@"shop_id",
                              @"shop_name":@"shop_name",
                              @"lon":@"longitude",
                              @"lat":@"latitude",
                              @"distance":@"distance",
                              @"shop_url":@"shop_url",
                              @"shop_murl":@"shop_murl",
                              @"deal_num":@"deal_num"};
    return mapAttr;
}

- (void)setAttributes:(NSDictionary *)dataDic {

    [super setAttributes:dataDic];
    
    NSArray *dArrary = [dataDic objectForKey:@"deals"];
    _dealsModelArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dealDic in dArrary) {
        
        DealsModel *model = [[DealsModel alloc] initWithDataDic:dealDic];
        [_dealsModelArray addObject:model];
    }
}

@end
