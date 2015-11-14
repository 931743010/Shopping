//
//  HeadView.m
//  测试CT
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "HomeCollectionView.h"
#import "SpecialCell.h"
#import "BlockModel.h"

@implementation HomeCollectionView

- (id)initWithFrame:(CGRect)frame {
 
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _layout.itemSize = CGSizeMake(50, 50);
    _layout.minimumInteritemSpacing = 0;
    _layout.minimumLineSpacing = 0;
    
    _layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    self = [super initWithFrame:frame collectionViewLayout:_layout];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = [UIColor whiteColor];
        
        UINib *nib = [UINib nibWithNibName:@"SpecialCell" bundle:[NSBundle mainBundle]];
        [self registerNib:nib forCellWithReuseIdentifier:@"specialCell"];
        
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    if (section == 0) { //第一组
        return 1;
    } else if (section == 1) { //第二组
    
        return 3;
    } else { //第三组
    
        return 4;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.borderColor = [UIColor darkGrayColor].CGColor;
    cell.layer.borderWidth = 0.25;
    
    SpecialCell *specialCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"specialCell" forIndexPath:indexPath];
    
    specialCell.backgroundColor = [UIColor whiteColor];
    specialCell.layer.borderColor = [UIColor darkGrayColor].CGColor;
    specialCell.layer.borderWidth = 0.25;
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:13];
    [cell.contentView addSubview:label];
    
    UILabel *subLabel = [[UILabel alloc] init];
    subLabel.font = [UIFont systemFontOfSize:10];
    [cell.contentView addSubview:subLabel];
    
    UIImageView *spImgView = [[UIImageView alloc] init];
    [cell.contentView addSubview:spImgView];
    
    if (indexPath.section == 0) {
        
        label.frame = CGRectMake(5, 10, 100, 20);
        label.text = self.blockOneDic[@"adv_title"];
        
        subLabel.frame = CGRectMake(5, 30, 150, 20);
        subLabel.text = self.blockOneDic[@"adv_subtitle"];
        
        spImgView.frame = CGRectMake(kScreenWidth - 75, 5, 59, 54);
        [spImgView sd_setImageWithURL:[NSURL URLWithString:self.blockOneDic[@"picture_url"]]];
        
        return cell;
        
    }
    
    if (indexPath.section == 1) { //第二组 大单元格
        
        BlockModel *model = self.blockTwoArray[indexPath.item];
        
        specialCell.model = model;
        
        if (indexPath.item == 1) { //大单元格
            
            specialCell.frame = CGRectMake(kScreenWidth/2, 65, kScreenWidth/2, 130);
            
            [specialCell.spImgView removeFromSuperview];
            
        }
        
        return specialCell;
        
    } else  { //第三组 右边单元格
        
        specialCell.bigImagView.hidden = YES;
        
        BlockModel *model = self.blockThreeArray[indexPath.item];
        specialCell.model = model;
    
        if (indexPath.item == 1) {
            
            specialCell.frame = CGRectMake(kScreenWidth/2, 195, kScreenWidth/2, 65);
            
        } else if (indexPath.item == 3) {
        
            specialCell.frame = CGRectMake(kScreenWidth/2, 260, kScreenWidth/2, 65);
        }
        
        return specialCell;
    }

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    CGSize itemSize = _layout.itemSize;
    
    if (indexPath.section == 0 && indexPath.item == 0) {
        //第一组
        itemSize = CGSizeMake(kScreenWidth, 65);
    } else if (indexPath.section == 1) { //第二组
    
        if (indexPath.item == 0) {
            
            itemSize = CGSizeMake(kScreenWidth/2, 65);
        } else if (indexPath.item == 1) {
        
            itemSize = CGSizeMake(kScreenWidth/2, 65);
        } else {
        
            itemSize = CGSizeMake(kScreenWidth/2, 65);
        }
    } else if (indexPath.section == 2) { //第三组
    
        itemSize = CGSizeMake(kScreenWidth/2, 65);
    }
    
    return itemSize;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"选中%li",indexPath.item);
    
}

//更多按钮方法
- (void)moreButtonAction {

}

@end
