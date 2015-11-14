//
//  ShopAnnotation.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/29.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "ShopModel.h"

@interface ShopAnnotation : NSObject

@property(nonatomic,assign)CLLocationCoordinate2D coordinate;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *subTitle;

@property(nonatomic,strong)ShopModel *model;

@end
