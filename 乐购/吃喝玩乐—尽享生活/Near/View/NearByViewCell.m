//
//  NearByViewCell.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/25.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "NearByViewCell.h"

@implementation NearByViewCell

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
    
    //图片
    [_nearImgView sd_setImageWithURL:[NSURL URLWithString:_model.tiny_image]];
    
    //描述
    _nearDescriptionLabel.text = _model.dealsDescription;
    
    //现价
    CGFloat cp = [_model.current_price floatValue] / 100.0;
    _currentPriceLabel.text = [NSString stringWithFormat:@"￥%.2f",cp];
    //市场价
    CGFloat mp = [_model.market_price floatValue] / 100.0;
    _marketPriceLabel.text = [NSString stringWithFormat:@"%.0f",mp];
    [_marketPriceLabel setStrikeShrough:_marketPriceLabel.text];
    
    //售出数量
    CGFloat sn = [_model.sale_num floatValue] / 10000.0;
    _saleNumLabel.text = [NSString stringWithFormat:@"已售 %.0f万",sn];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
