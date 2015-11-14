//
//  ChoiceViewCell.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ChoiceViewCell.h"

@implementation ChoiceViewCell

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
    if (!_model.is_reservation_required) {
        
        [_shopImgView sd_setImageWithURL:[NSURL URLWithString:_model.tiny_image] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            _shopImgView.image = [image addWaterImage:@"a_xiangqing_mianyuyue_icon.png"];
            
        }];
    } else {
        
        [_shopImgView sd_setImageWithURL:[NSURL URLWithString:_model.tiny_image]];
    
    }
    
    //店名
    _shopNameLabel.text = _model.title;
    //距离
    CGFloat distance = [_model.distance floatValue] / 1000.0;
    _distanceLabel.text = [NSString stringWithFormat:@"%.1fkm",distance];
    //子标题
    _subTitleLabel.text = _model.dealsDescription;
    //现价
    CGFloat currentPrice = [_model.current_price floatValue] / 100;
    _currentPriceLabel.text = [NSString stringWithFormat:@"￥%.0f",currentPrice];
    //市场价
    CGFloat marketPrice = [_model.market_price floatValue] / 100;
    _marketPriceLabel.text = [NSString stringWithFormat:@"%.0f",marketPrice];
    [_marketPriceLabel setStrikeShrough:_marketPriceLabel.text];
    
    //评分
    _scoreLabel.text = [NSString stringWithFormat:@"%@分 售%@",_model.score,_model.sale_num];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
