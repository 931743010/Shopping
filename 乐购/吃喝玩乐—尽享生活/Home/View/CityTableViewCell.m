//
//  CityTableViewCell.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CityTableViewCell.h"

@implementation CityTableViewCell

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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
