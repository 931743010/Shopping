//
//  TableView.h
//  测试CT
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeMainTableView : UITableView <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *dataArray;

@end
