//
//  ChoiceViewCell.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChoiceModel.h"
#import "DealsModel.h"

@interface ChoiceViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *shopImgView;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentPriceLabel;
@property (weak, nonatomic) IBOutlet BaseLabel *marketPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

//@property(nonatomic,strong)ChoiceModel *model;
@property(nonatomic,strong)DealsModel *model;

@end
