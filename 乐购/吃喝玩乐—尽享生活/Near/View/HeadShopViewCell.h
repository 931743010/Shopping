//
//  HeadShopViewCell.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/25.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopMall.h"

@interface HeadShopViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mallImgView;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
@property (weak, nonatomic) IBOutlet UILabel *recLabel;


@property(nonatomic,strong)ShopMall *mall;

@end
