//
//  SpecialCell.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "SpecialCell.h"

@implementation SpecialCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(BlockModel *)model {

    if (_model != model) {
        
        _model = model;
        
        [self setNeedsLayout];
        
    }
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    _nameLabel.text = _model.adv_title;
    _subLabel.text = _model.adv_subtitle;
    
    [_spImgView sd_setImageWithURL:[NSURL URLWithString:_model.picture_url]];
    
    [_bigImagView sd_setImageWithURL:[NSURL URLWithString:_model.picture_url]];
}

@end
