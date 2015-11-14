//
//  BaseTabBarController.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MainTabBarController.h"
#import "BaseNaviController.h"
#import "TabBarButton.h"
#import "Commen.h"
#import "CategoryCollectionView.h"
#import "CategoryModel.h"

static NSInteger flag = 0;

@interface MainTabBarController () {
    
    NSArray *_btnNorImages; //普通图片数组
    NSArray *_pinkImages;   //粉红图片数组
    
    NSMutableArray *_btnArray; // 用来存放按钮
    
    TabBarButton *_tabButton; //标签栏按钮
    
    NSArray *_names; //标签栏下文字
    
    UIView *_classView; //分类视图
    
    CategoryCollectionView *_collectionView; //集合视图
    
    NSMutableArray *_data;
}

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载子控制器
    [self _loadSubController];
    
    //创建TabBar
    [self _creatTabBar];
    
    //创建ClassView
    [self createClassView];
    
    //分类部分数据加载
    [self _loadCategoryData];
    
}

- (void)_creatTabBar {

    //影藏tabBarButton
    for (UIView *view in self.tabBar.subviews) {
        
        Class cls = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cls]) {
            
            [view removeFromSuperview];
        }
    }
    
    //图片数组
    _btnNorImages = @[@"icon_tab_shouye_normal.png",
                      @"icon_tab_fujin_normal.png",
                      @"icon_nor_tab_0.png",
                      @"tab_icon_selection_normal.png",
                      @"icon_tab_wode_normal.png"];
    //粉红图片数组
    _pinkImages = @[@"icon_tab_shouye_highlight.png",
                    @"icon_tab_fujin_highlight.png",
                    @"icon_sel_0_tab.png",
                    @"tab_icon_selection_highlight.png",
                    @"icon_tab_wode_highlight.png"];
    
    //TabBarButton下名字
    _names = @[@"首页",
              @"附近",
              @"分类",
              @"精选",
              @"我的"];
    
    //按钮宽度
    CGFloat width = kScreenWidth / _names.count;
    
    flag = 0;
    _btnArray = [[NSMutableArray alloc] init];
    
    //创建button
    for (NSInteger i = 0; i <= _btnNorImages.count-1; i++) {

        _tabButton = [[TabBarButton alloc] initWithFrame:CGRectMake(i * width, 0, width, 49)];
        _tabButton.tag = i;
        
        if (i == 0) { //首页默认为粉红图片和粉红字体
            
            [_tabButton setWithTitle:_names[i] imageName:_pinkImages[i]];
            [_tabButton setNewTitle:_names[i]];
            
        }
        else {
            
            [_tabButton setWithTitle:_names[i] imageName:_btnNorImages[i]];
        }
        
        [_tabButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_btnArray addObject:_tabButton];
        
        [self.tabBar addSubview:_tabButton];
    }
    
}

- (void)buttonAction:(TabBarButton *)button {
    
    if (button.tag != 2) {
        
        self.selectedIndex = button.tag;
    }
    
    if (button.tag == 2) {

        [self classViewMoveUp];
        [self.view insertSubview:_classView aboveSubview:self.tabBar];
    }
    
    if (flag == button.tag) {
        
    } else { //颜色改变
    
        TabBarButton *btn = _btnArray[flag];
        
        [btn setNewImage:_btnNorImages[flag]];
        [button setNewImage:_pinkImages[button.tag]];
        
        [btn setNorTitle:_names[flag]];
        [button setNewTitle:_names[button.tag]];
        
    }
    flag = button.tag;

}

//创建ClassView
- (void)createClassView {

    _classView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight)];
    _classView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    [self.view addSubview:_classView];
    
    //创建ClassView的关闭按钮
    [self _createBackButon];
    
    _collectionView = [[CategoryCollectionView alloc] initWithFrame:CGRectMake(0, 32, kScreenWidth, _classView.height - 35)];
    [_classView addSubview:_collectionView];
    
}

//ClassView上移方法
- (void)classViewMoveUp {

    [UIView animateWithDuration:0.6 animations:^{
        
        _classView.top = 20;
    }];
}

//ClassView下移方法
- (void)classViewMoveDown {

    [UIView animateWithDuration:0.6 animations:^{
        
        _classView.top = kScreenHeight;
    }];
    
}

//创建ClassView的关闭按钮
- (void)_createBackButon {
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - 35, 5, 30, 30)];
    [backButton setImage:[UIImage imageNamed:@"voice_guanbi_normal.png"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"voice_guanbi_pressed.png"] forState:UIControlStateSelected];
    [backButton addTarget:self action:@selector(classViewMoveDown) forControlEvents:UIControlEventTouchUpInside];
    [_classView addSubview:backButton];
    
}


//加载子控制器
- (void)_loadSubController {
    
    NSArray *names = @[@"Home",
                       @"Near",
                       @"Classify",
                       @"Choice",
                       @"Mine"];
    
    NSMutableArray *naviArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    for (int i = 0; i < names.count; i ++) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:names[i] bundle:nil];
        
        BaseNaviController *naviC = [storyboard instantiateInitialViewController];
        
        [naviArray addObject:naviC];
    }
    
    self.viewControllers = naviArray;

}

//分类部分数据加载
- (void)_loadCategoryData {
    
    NSString *urlStr = @"http://app.nuomi.com/naserver/home/homepage";
    NSString *httpArg = @"page_type=component&appid=android&tn=android&terminal_type=android&device=Xiaomi+2014812&channel=1006900a&v=5.13.2&os=SDK19&cityid=600010000&location=30.32402%2C120.350529&cuid=F0DF94CD7CC07BDF0FA191ACA26AAF4E%7C079304320240668&uuid=ffffffff-cd9e-be17-3c1d-5697050e83f7&timestamp=1445150363930&swidth=720&sheight=1280&net=wifi&sign=c052d0c41b66217ec95c509f25683cc4";
    
    [MyNetWorkQuery requestData:urlStr HTTPMethod:@"GET" httpArg:httpArg completionHandle:^(id result) {
        
        NSDictionary *dealDic = [result objectForKey:@"data"];
        NSArray *deal = [dealDic objectForKey:@"category"];
        
        NSMutableArray *dataArray = [[NSMutableArray alloc] init];
        _data = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dataDic in deal) {
            CategoryModel *model = [[CategoryModel alloc] initWithDataDic:dataDic];
            
            [dataArray addObject:model];
            
        }
        _data = dataArray;
        _collectionView.dataArray = _data;
        [_collectionView reloadData];
        
    } errorHandle:^(NSError *error) {
        NSLog(@"加载数据出错:%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
