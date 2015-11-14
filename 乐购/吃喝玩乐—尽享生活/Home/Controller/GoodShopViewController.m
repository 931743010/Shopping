//
//  GoodShopViewController.m
//  吃喝玩乐—尽享生活
//
//  Created by yons on 15/10/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "GoodShopViewController.h"
#import "GoodShopViewCell.h"
#import "DealsModel.h"
#import "ShopViewController.h"

@interface GoodShopViewController () {

    UICollectionViewFlowLayout *_layout;
}

@end

@implementation GoodShopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.hidesBottomBarWhenPushed = YES;
        [self leftNavBackButtonAction];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建Views
    [self _createView];
    
    //创建导航栏返回按钮
    [self backButtonAction];
    
}

//创建导航栏返回按钮
- (void)backButtonAction {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 90, 36);
    [button setImage:[UIImage imageNamed:@"icon_web_goback_dis.png"] forState:UIControlStateNormal];
    
    [button setTitle:@"推荐店铺" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button addTarget:self action:@selector(navButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)navButtonAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)_createView {

    //创建一个布局对象
    _layout = [[UICollectionViewFlowLayout alloc] init];
    //单元格大小
    _layout.itemSize = CGSizeMake(100, 120);
    //水平最小间距
    _layout.minimumInteritemSpacing = 5;
    //竖直最小间距
    _layout.minimumLineSpacing = 5;
    //设置四周间隙
    _layout.sectionInset = UIEdgeInsetsMake(5, 0, 5, 0);
    //使用布局对象创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:_layout];
    
    collectionView.dataSource = self;
    collectionView.delegate  = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:collectionView];
    
    UINib *nib = [UINib nibWithNibName:@"GoodShopViewCell" bundle:[NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"goodCell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.shopArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    GoodShopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"goodCell" forIndexPath:indexPath];
    
    DealsModel *model = self.shopArray[indexPath.item];
    cell.model = model;

    cell.hotWordLabel.hidden = YES;

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    CGSize itemSize = _layout.itemSize;
    
    if (indexPath.item < 3) {
        
        itemSize = CGSizeMake(kScreenWidth - 20, 200);
    } else {
    
        itemSize = CGSizeMake(kScreenWidth/2 - 10, 150);
        
        //设置四周间隙
        _layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    }
    
    
    return itemSize;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    ShopViewController *shopVC = [[ShopViewController alloc] init];
    
    DealsModel *model = self.shopArray[indexPath.item];
    shopVC.model = model;
    
    [self.navigationController pushViewController:shopVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
