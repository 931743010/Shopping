//
//  GoodShopView.h
//  吃喝玩乐—尽享生活
//
//  Created by yons on 15/10/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodShopView : UICollectionView <UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)NSArray *goodShopArray;

@end
