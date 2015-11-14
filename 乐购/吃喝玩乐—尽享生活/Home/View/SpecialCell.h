//
//  SpecialCell.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockModel.h"

@interface SpecialCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
@property (weak, nonatomic) IBOutlet UIImageView *spImgView;
@property (weak, nonatomic) IBOutlet UIImageView *bigImagView;

@property(nonatomic,strong)BlockModel *model;

@end
