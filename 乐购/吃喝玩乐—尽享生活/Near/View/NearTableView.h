//
//  NearTableView.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopCollectionView.h"

@interface NearTableView : UITableView <UITableViewDataSource,UITableViewDelegate> {

    ShopCollectionView *_shopView;
}

@property(nonatomic,strong)NSArray *shopsArray;
@property(nonatomic,strong)NSArray *dealsArray;

@property(nonatomic,strong)NSArray *mallArray;

@end
