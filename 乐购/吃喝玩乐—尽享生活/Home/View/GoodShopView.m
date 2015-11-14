//
//  GoodShopView.m
//  吃喝玩乐—尽享生活
//
//  Created by yons on 15/10/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "GoodShopView.h"
#import "GoodShopViewCell.h"
#import "DealsModel.h"
#import "ShopViewController.h"

@implementation GoodShopView

- (id)initWithFrame:(CGRect)frame {

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    //单元格大小
    layout.itemSize = CGSizeMake(100, 100);
    //水平最小间距
    layout.minimumInteritemSpacing = 5;
    //竖直最小间距
    layout.minimumLineSpacing = 5;
    
    //四周间距
    layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        
        self.dataSource = self;
        self.delegate = self;
        
        self.backgroundColor = [UIColor whiteColor];
        
        UINib *nib = [UINib nibWithNibName:@"GoodShopViewCell" bundle:[NSBundle mainBundle]];
        [self registerNib:nib forCellWithReuseIdentifier:@"goodCell"];
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    GoodShopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"goodCell" forIndexPath:indexPath];
    
    DealsModel *model = self.goodShopArray[indexPath.item];
    cell.model = model;
        
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    ShopViewController *shopVC = [[ShopViewController alloc] init];
    
    DealsModel *model = self.goodShopArray[indexPath.item];
    shopVC.model = model;
    
    [self.viewController.navigationController pushViewController:shopVC animated:YES];
}

@end
