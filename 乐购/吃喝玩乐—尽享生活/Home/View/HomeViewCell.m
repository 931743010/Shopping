//
//  HomeViewCell.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "HomeViewCell.h"

@implementation HomeViewCell

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
    
    //商店图片
    if (!_model.is_reservation_required) {
        
        [_shopImgView sd_setImageWithURL:[NSURL URLWithString:_model.tiny_image] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            _shopImgView.image = [image addWaterImage:@"a_xiangqing_mianyuyue_icon.png"];
        }];
    } else {
    
        [_shopImgView sd_setImageWithURL:[NSURL URLWithString:_model.tiny_image]];
    }
    
    
    //商店名
    _shopNameLabel.text = _model.title;
    //距离
    CGFloat dt = [_model.distance floatValue];
    if (dt > 1000) {
        
        dt = dt / 1000.0;
        _distanceLabel.text = [NSString stringWithFormat:@"%.1fkm",dt];
    } else {
    
        _distanceLabel.text = [NSString stringWithFormat:@"%.0fm",dt];
    }
    
    //商店描述
    _shopDescriptionLabel.text = _model.dealsDescription;
    
    //售卖价格  单位是分
    CGFloat cp = [_model.current_price floatValue] / 100.0;
    _presentPriceLabel.text = [NSString stringWithFormat:@"￥%.2f",cp];
    
    //市场价格，单位是分
    CGFloat op = [_model.market_price floatValue] / 100.00;
    _originalPriceLabel.text = [NSString stringWithFormat:@"%.0f",op];
    [_originalPriceLabel setStrikeShrough:_originalPriceLabel.text];
    
    //用户评分
    CGFloat score = [_model.score floatValue];
    _sourceLabel.text = [NSString stringWithFormat:@"%.1f分",score];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
