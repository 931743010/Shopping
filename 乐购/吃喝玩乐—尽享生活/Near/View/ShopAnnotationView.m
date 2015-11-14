//
//  ShopAnnotationView.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/29.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ShopAnnotationView.h"
#import "ShopAnnotation.h"
#import "ShopModel.h"

@implementation ShopAnnotationView

- (instancetype)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.frame = CGRectMake(0, 0, 140, 40);
      
        [self _createViews];
    }
    return self;
}

- (void)_createViews {
    
    _headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    _headImgView.image = [UIImage imageNamed:@"icon_map.png"];
    
    _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, 100, 40)];
    _textLabel.backgroundColor = [UIColor darkGrayColor];
    _textLabel.text = @"SHOP";
    
    [self addSubview:_headImgView];
    [self addSubview:_textLabel];
    
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    ShopAnnotation *annotation = self.annotation;
    ShopModel *model = annotation.model;
    
    _textLabel.text = model.shop_name;
    _textLabel.font = [UIFont systemFontOfSize:10];
    _textLabel.numberOfLines = 3;
    
    
    NSString *urlString = model.dealModel.tiny_image;
    [_headImgView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:@"account_place_holder.png"]];
    
    
}

@end
