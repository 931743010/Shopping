//
//  ShopModel.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

/*
 deals团单列表数组
 deal_id			团单id				int
 image			图片链接			string
 tiny_image		小图链接			string
 title			商户标题			string
 description		商户描述			string
 market_price	市场价格，单位是分	int
 current_price	售卖价格，单位是分	int
 promotion_price	活动价格，单位是分	int
 sale_num		已售团单数量		int
 score			用户评分			float
 comment_num		用户评论个数 		int
 deal_url		Pc团单详情页		string
 deal_murl		Wap团详情页			string
 */

#import "BaseModel.h"
#import "DealsModel.h"

@interface ShopModel : BaseModel

@property(nonatomic,retain)NSNumber *shop_id;     //商店id
@property(nonatomic,copy)NSString   *shop_name;   //商店名
@property(nonatomic,retain)NSNumber   *lon;         //经度
@property(nonatomic,retain)NSNumber   *lat;         //纬度
@property(nonatomic,retain)NSNumber *deal_num;    //团单数量
@property(nonatomic,copy)NSString   *distance;    //距离

@property(nonatomic,copy)NSString   *shop_url;    //Pc团单详情页
@property(nonatomic,copy)NSString   *shop_murl;   //Wap团详情页

@property(nonatomic,strong)NSMutableArray *array;

@property(nonatomic,strong)DealsModel *dealModel; //团单列表信息
@property(nonatomic,strong)NSMutableArray *dealsModelArray;

@end
