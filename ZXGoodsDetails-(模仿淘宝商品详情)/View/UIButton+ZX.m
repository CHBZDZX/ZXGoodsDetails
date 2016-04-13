//
//  UIButton+ZX.m
//  ZXGoodsDetails-(模仿淘宝商品详情)
//
//  Created by iMac on 16/3/17.
//  Copyright © 2016年 ZX. All rights reserved.
//

#import "UIButton+ZX.h"

@implementation UIButton (ZX)

+ (UIButton *)buttonWithType:(UIButtonType)buttonType frameX:(CGFloat)x frameY:(CGFloat)y frameW:(CGFloat)width frameH:(CGFloat)height buttonNormalTitle:(NSString *)buttonNormalTitle buttonSelectedTitle:(NSString *)buttonSelectedTitle normalTitleColor:(UIColor *)normalTitleColor selectedTitleColor:(UIColor *)selectedTitleColor {
    UIButton *button = [UIButton buttonWithType:buttonType];
    button.frame = CGRectMake(x, y, width, height);
    [button setTitle:buttonNormalTitle forState:UIControlStateNormal];
    [button setTitle:buttonSelectedTitle forState:UIControlStateSelected];
    [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [button setTitleColor:selectedTitleColor forState:UIControlStateSelected];
    return button;
}

+ (UIButton *)buttonWithType:(UIButtonType)buttonType frameX:(CGFloat)x frameY:(CGFloat)y frameW:(CGFloat)width frameH:(CGFloat)height buttonNormalImage:(UIImage *)buttonNormalImage buttonSelectedImage:(UIImage *)buttonSelectedImage {
    UIButton *button = [UIButton buttonWithType:buttonType];
    button.frame = CGRectMake(x, y, width, height);
    [button setImage:buttonNormalImage forState:UIControlStateNormal];
    [button setImage:buttonSelectedImage forState:UIControlStateSelected];
    return button;
}

@end
