//
//  CitiesModel.h
//  吃喝玩乐—尽享生活
//
//  Created by yons on 15/10/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//
/*
 "city_id": 100010000,
 "city_name": "北京市",
 "short_name": "北京",
 "city_pinyin": "beijing",
 "short_pinyin": "bj"
 */

#import "BaseModel.h"

@interface CitiesModel : BaseModel

@property(nonatomic,retain)NSNumber *city_id;
@property(nonatomic,copy)NSString *city_name;
@property(nonatomic,copy)NSString *short_name;
@property(nonatomic,copy)NSString *city_pinyin;
@property(nonatomic,copy)NSString *short_pinyin;

@end
