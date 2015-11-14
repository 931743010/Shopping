//
//  TabBarButton.m
//  DyfTimeMovie
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "TabBarButton.h"

@interface TabBarButton() {

    UIImageView *_imageView;
    UILabel *label;
}
@end

@implementation TabBarButton

- (id)initWithTitle:(NSString *)title imageName:(NSString *)imageName frmae:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 30) / 2, 2, 30, 30)];
        _imageView.image = [UIImage imageNamed:imageName];
        [self addSubview:_imageView];
        
        //图片的拉伸模式
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 32, frame.size.width, 15)];
        label.text = title;
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:13];
        [self addSubview:label];
        
    }
    return self;
}

- (void)setWithTitle:(NSString *)title imageName:(NSString *)imageName {

    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - 30) / 2, 2, 30, 30)];
    _imageView.image = [UIImage imageNamed:imageName];
    [self addSubview:_imageView];
    
    //图片的拉伸模式
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 32, self.frame.size.width, 15)];
    label.text = title;
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:13];
    [self addSubview:label];
}

- (void)setNorTitle:(NSString *)title {

    label.text = title;
    label.textColor = [UIColor grayColor];
}

- (void)setNewTitle:(NSString *)title {
    
    label.text = title;
    label.textColor = [UIColor colorWithRed:253/255.0 green:67/255.0 blue:126/255.0 alpha:1];
 

}

- (void)setNewImage:(NSString *)imageName {
    
    _imageView.image = [UIImage imageNamed:imageName];
    
}

@end
