//
//  HomeViewCell.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DealsModel.h"

@interface HomeViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *shopImgView;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *shopDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *presentPriceLabel;
@property (weak, nonatomic) IBOutlet BaseLabel *originalPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *logLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;


@property(nonatomic,strong)DealsModel *model;

@end
