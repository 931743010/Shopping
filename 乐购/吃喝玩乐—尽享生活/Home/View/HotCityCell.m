//
//  HotCityCell.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "HotCityCell.h"

@implementation HotCityCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(CitiesModel *)model {

    if (_model != model) {
        
        _model = model;
        
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    _cityNameLabel.text = _model.city_name;
}

@end
