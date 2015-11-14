//
//  BaseLabel.m
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseLabel.h"

@implementation BaseLabel

- (void)setStrikeShrough:(NSString *)string {

    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    //设置删除线
    [attriStr addAttribute:NSStrikethroughStyleAttributeName value:@1 range:NSMakeRange(0, string.length)];
    //设置删除线颜色
    [attriStr addAttribute:NSStrikethroughColorAttributeName value:[UIColor darkGrayColor] range:NSMakeRange(0, string.length)];
    
    self.attributedText = attriStr;
    
}

@end
