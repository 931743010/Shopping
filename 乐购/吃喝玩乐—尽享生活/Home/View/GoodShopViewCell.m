//
//  GoodShopViewCell.m
//  吃喝玩乐—尽享生活
//
//  Created by yons on 15/10/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "GoodShopViewCell.h"

@implementation GoodShopViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(DealsModel *)model {

    if (_model != model) {
        
        _model = model;
        
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    [_shopImgView sd_setImageWithURL:[NSURL URLWithString:_model.image]];
    
    _shopNameLabel.text = _model.title;
    
    CGFloat promPrice = [_model.promotion_price floatValue] / 100.0;
    _saleNumLabel.text = [NSString stringWithFormat:@"促销价:￥%.1f",promPrice];
    
    CGFloat score = [_model.score floatValue];
    _scoreLabel.text = [NSString stringWithFormat:@"%.1f分",score];
}

@end
