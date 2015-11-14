//
//  UIImage+WaterImage.m
//  图片水印
//
//  Created by mac on 15/9/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "UIImage+WaterImage.h"

@implementation UIImage (WaterImage)

- (UIImage *)addWaterImage:(NSString *)imageName {

    UIImage *kekeImage = [UIImage imageNamed:imageName];
    
    //获取图片的图形上下文
    UIGraphicsBeginImageContext(self.size);
    
    //向上下文中绘制内容图片
    [self drawAtPoint:CGPointZero];
    
    //计算水印图片的位置
    CGFloat waterHeight = self.size.height * 0.5;
    CGFloat waterWidth = self.size.width * 0.5;
    
//    if (waterHeight * 3 < waterWidth) {
//        waterWidth = waterHeight * 3;
//    }
//    else
//    {
//        waterHeight = waterWidth / 3;
//    }
    
    CGRect frame = CGRectMake(0, 0, waterWidth, waterHeight);
    
    //将水印图片绘制到上下文中
    [kekeImage drawInRect:frame];
    
    //获取绘制完毕的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
