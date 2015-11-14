//
//  SideCollectionView.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CitiesCollectionView.h"
#import "CitiesModel.h"
#import "HotCityCell.h"

@implementation CitiesCollectionView


- (id)initWithFrame:(CGRect)frame {

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //单元格大小
    layout.itemSize = CGSizeMake(80, 22);
    //水平最小间距
    layout.minimumInteritemSpacing = 5;
    //竖直最小间距
    layout.minimumLineSpacing = 5;
    
    layout.sectionInset = UIEdgeInsetsMake(2, 2, 2, 2);
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
        [self _loadData];
        
        self.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
        
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        UINib *nib = [UINib nibWithNibName:@"HotCityCell" bundle:[NSBundle mainBundle]];
        [self registerNib:nib forCellWithReuseIdentifier:@"hotCell"];
        
    }
    return self;
    
}

//加载数据
- (void)_loadData {
    
    [MyNetWorkQuery AFRequestData:Cities HTTPMethod:@"GET" params:nil completionHandle:^(id result) {
        
        if (result != nil) {
            
            NSArray *citiesArray = [result objectForKey:@"cities"];
            
            NSMutableArray *mutArray = [[NSMutableArray alloc] init];
            _hotCityArray = [[NSMutableArray alloc] init];
            for (NSDictionary *dic in citiesArray) {
                
                CitiesModel *model = [[CitiesModel alloc] initWithDataDic:dic];
                [mutArray addObject:model];
                
            }

            self.hotCityArray = mutArray;
            [self reloadData];
        }
        
    } errorHandle:^(NSError *error) {
        NSLog(@"获取城市列表出错");
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    if (section == 0) {
        
        return 1;
    } else {
    
        return 9;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    HotCityCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hotCell" forIndexPath:indexPath];
    
    UICollectionViewCell *hotcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.layer.cornerRadius = 2;
    
    if (indexPath.section == 0 && indexPath.item == 0) { //热门城市
        
        UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
        [hotcell.contentView addSubview:label];
        label.font = [UIFont systemFontOfSize:14];
        label.text = @"热门城市";
        
        return hotcell;
        
    } else { //热门城市列表
        
        cell.backgroundColor = [UIColor whiteColor];
        
        CitiesModel *model = self.hotCityArray[indexPath.item];
        
        cell.model = model;
        
        return cell;
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0 && indexPath.row == 0) {
        
        return;
        
    } else {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"toGetCityID" object:self.hotCityArray[indexPath.item]];
        
        [self.viewController.navigationController popViewControllerAnimated:YES];

    }
    
}



@end
