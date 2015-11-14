//
//  TabBarButton.h
//  DyfTimeMovie
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarButton : UIButton

- (id)initWithTitle:(NSString *)title imageName:(NSString *)imageName frmae:(CGRect)frame;

- (void)setWithTitle:(NSString *)title imageName:(NSString *)imageName;

- (void)setNorTitle:(NSString *)title;

- (void)setNewTitle:(NSString *)title;

- (void)setNewImage:(NSString *)imageName;

@end
