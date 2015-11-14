//
//  CategoryModel.m
//  吃喝玩乐—尽享生活
//
//  Created by yons on 15/10/18.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

- (NSDictionary *)attributeMapDictionary {
    
    NSDictionary *mapAttr = @{@"categoryName":@"category_name",
                              @"categoryPic":@"category_picurl"};
    
    return mapAttr;

}

@end
