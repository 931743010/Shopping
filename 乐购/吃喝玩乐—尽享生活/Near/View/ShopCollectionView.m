//
//  ShopCollectionView.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ShopCollectionView.h"
#import "HeadShopViewCell.h"
#import "ShopMall.h"

@implementation ShopCollectionView


- (id)initWithFrame:(CGRect)frame {

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //单元格大小
    layout.itemSize = CGSizeMake(kScreenWidth / 3 - 5, 144);
    //水平最小间隙
    layout.minimumInteritemSpacing = 0;
    //竖直最小间隙
    layout.minimumLineSpacing = 0;
    //设置四周间隙
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
        self.backgroundColor = [UIColor whiteColor];
        
        UINib *nib = [UINib nibWithNibName:@"HeadShopViewCell" bundle:[NSBundle mainBundle]];
        
        [self registerNib:nib forCellWithReuseIdentifier:@"headCell"];
    }
    return self;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _shopMallArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    HeadShopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"headCell" forIndexPath:indexPath];
 
    ShopMall *mall = _shopMallArray[indexPath.item];
    cell.mall = mall;
    
    NSString *imageName = [NSString stringWithFormat:@"mall%li",indexPath.item+1];
    cell.mallImgView.image = [UIImage imageNamed:imageName];
    
    return cell;
}


@end
