//
//  CategoryViewCell.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/19.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryModel.h"

@interface CategoryViewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *categoryImgView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@property(nonatomic,strong)CategoryModel *model;

@end
