//
//  ShopAnnotation.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/29.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ShopAnnotation.h"

@implementation ShopAnnotation


- (void)setModel:(ShopModel *)model {

    if (_model != model) {
        
        _model = model;
        
        CGFloat longitutde = [model.lon floatValue];
        CGFloat latitude = [model.lat floatValue];
        
        self.coordinate = CLLocationCoordinate2DMake(longitutde, latitude);
    }
}

@end
