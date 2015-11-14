//
//  DealsModel.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/16.
//  Copyright (c) 2015年 mac. All rights reserved.
//
/*
 "deal_id": 3122647,
 "image": "http://S0.nuomi.bdimg.com/upload/mfs201503/deal/2015/2/V_L/3122647-kg26yggyt7-1909498613860169.jpg",
 "tiny_image": "http://S2.nuomi.bdimg.com/upload/mfs201503/deal/2015/2/V_T/3122647-hq7m6jvuv6-34960081911580904.jpg",
 "title": "金鼎轩",
 "description": "价值100元代金券！可叠加使用！",
 "market_price": 10000,              //团单原价，单位分
 "current_price": 8990,             //团购价格,单位分
 "promotion_price": 8990,           //团单的促销价格，如果没有促销，价格是当前的团购价格，单位分
 "sale_num": 44670,
 "score": 4.62,
 "comment_num": 4319,
 "publish_time": 1424095200,         //团单发布时间
 "purchase_deadline": 1451566800,      //团单购买的最后期限
 "is_reservation_required": false,
 "distance": -1,
 "shop_num": 21,
 "deal_url": "http://www.nuomi.com/cps/redirect?cid=openapi&app_id=c57ffbcff1403c460cb3e29964dcbd69&url=http%3A%2F%2Fbj.nuomi.com%2Fdeal%2Fzxnnkv5i.html", //pc的详情页
 "deal_murl": "http://www.nuomi.com/cps/redirect?cid=openapi&app_id=c57ffbcff1403c460cb3e29964dcbd69&url=http%3A%2F%2Fm.nuomi.com%2Fbj%2Fdeal%2Fzxnnkv5i",  //移动端详情页
 */

#import "BaseModel.h"

@interface DealsModel : BaseModel

@property(nonatomic,retain)NSNumber *deal_id;   //
@property(nonatomic,copy)NSString *image;      //
@property(nonatomic,copy)NSString *tiny_image;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *dealsDescription;
@property(nonatomic,retain)NSNumber *market_price; //团单原价，单位分
@property(nonatomic,retain)NSNumber *current_price;//团购价格,单位分
@property(nonatomic,retain)NSNumber *promotion_price;//团单的促销价格，如果没有促销，价格是当前的团购价格，单位分
@property(nonatomic,retain)NSNumber *sale_num;
@property(nonatomic,retain)NSNumber *score;
@property(nonatomic,retain)NSNumber *comment_num;
@property(nonatomic,copy)NSString *publish_time;   //团单发布时间
@property(nonatomic,copy)NSString *purchase_deadline;//团单购买的最后期限

@property(nonatomic,retain)NSNumber *shopID;    //商户id
@property(nonatomic,retain)NSNumber *longitude;
@property(nonatomic,retain)NSNumber *latitude;
@property(nonatomic,retain)NSNumber *distance; ////当前距离与商户之间的距离，没有传递longitude，latitude字段会                                   返回-1
@property(nonatomic,assign)BOOL is_reservation_required; //是否筛选出免预约,否
@property(nonatomic,copy)NSString *shop_url; //pc端商户详情页
@property(nonatomic,copy)NSString *shop_murl; //wap端商户详情页
@property(nonatomic,copy)NSString *deal_murl;

@end
