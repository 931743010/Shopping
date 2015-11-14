//
//  HeadView.h
//  测试CT
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCollectionView : UICollectionView <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout> {

    UICollectionViewFlowLayout *_layout;
}

@property(nonatomic,strong)NSDictionary *blockOneDic;
@property(nonatomic,strong)NSArray *blockTwoArray;
@property(nonatomic,strong)NSArray *blockThreeArray;

@end
