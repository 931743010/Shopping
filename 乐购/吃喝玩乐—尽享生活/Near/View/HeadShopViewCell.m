//
//  HeadShopViewCell.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/25.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "HeadShopViewCell.h"

@implementation HeadShopViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setMall:(ShopMall *)mall {

    if (_mall != mall) {
    
        _mall = mall;
        
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    //距离
    _distanceLabel.text = _mall.distance;
    //名字
    _nameLabel.text = _mall.name;
    //子标题
    _subLabel.text = _mall.discount;
    
    //状态
    _recLabel.text = _mall.recReason[0];
    
}

@end
