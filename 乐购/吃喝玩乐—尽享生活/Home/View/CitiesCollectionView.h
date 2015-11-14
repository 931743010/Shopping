//
//  SideCollectionView.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CitiesCollectionView : UICollectionView <UICollectionViewDataSource,UICollectionViewDelegate> 

@property(nonatomic,strong)NSMutableArray *hotCityArray;

@end
