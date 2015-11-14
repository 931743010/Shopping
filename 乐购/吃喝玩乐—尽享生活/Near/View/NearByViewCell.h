//
//  NearByViewCell.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/25.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DealsModel.h"
#import "ShopModel.h"

@interface NearByViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *nearImgView;
@property (weak, nonatomic) IBOutlet UILabel *nearDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentPriceLabel;
@property (weak, nonatomic) IBOutlet BaseLabel *marketPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *saleNumLabel;


@property(nonatomic,strong)DealsModel *model;
//@property(nonatomic,strong)ShopModel *model;

@end
