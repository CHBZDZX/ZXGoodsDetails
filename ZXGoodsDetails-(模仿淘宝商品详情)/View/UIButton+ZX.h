//
//  UIButton+ZX.h
//  ZXGoodsDetails-(模仿淘宝商品详情)
//
//  Created by iMac on 16/3/17.
//  Copyright © 2016年 ZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZX)

+ (UIButton *)buttonWithType:(UIButtonType)buttonType frameX:(CGFloat)x frameY:(CGFloat)y frameW:(CGFloat)width frameH:(CGFloat)height buttonNormalTitle:(NSString *)buttonNormalTitle buttonSelectedTitle:(NSString *)buttonSelectedTitle normalTitleColor:(NSString *)normalTitleColor selectedTitleColor:(NSString *)selectedTitleColor;

+ (UIButton *)buttonWithType:(UIButtonType)buttonType frameX:(CGFloat)x frameY:(CGFloat)y frameW:(CGFloat)width frameH:(CGFloat)height buttonNormalImage:(UIImage *)buttonNormalImage buttonSelectedImage:(UIImage *)buttonSelectedImage;

@end
