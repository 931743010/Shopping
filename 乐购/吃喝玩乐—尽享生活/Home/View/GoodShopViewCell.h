//
//  GoodShopViewCell.h
//  吃喝玩乐—尽享生活
//
//  Created by yons on 15/10/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DealsModel.h"

@interface GoodShopViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *shopImgView;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *saleNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *hotWordLabel;

@property(nonatomic,strong)DealsModel *model;

@end
