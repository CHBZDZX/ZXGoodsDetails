//
//  UILabel+ZX.h
//  ZXGoodsDetails-(模仿淘宝商品详情)
//
//  Created by iMac on 16/3/17.
//  Copyright © 2016年 ZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ZX)

+ (UILabel *)labelWithFrameX:(CGFloat)x frameY:(CGFloat)y frameW:(CGFloat)width frameH:(CGFloat)height font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)color numberOfLines:(NSInteger)lines;

@end
