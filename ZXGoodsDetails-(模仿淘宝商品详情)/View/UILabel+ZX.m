//
//  UILabel+ZX.m
//  ZXGoodsDetails-(模仿淘宝商品详情)
//
//  Created by iMac on 16/3/17.
//  Copyright © 2016年 ZX. All rights reserved.
//

#import "UILabel+ZX.h"

@implementation UILabel (ZX)

+ (UILabel *)labelWithFrameX:(CGFloat)x frameY:(CGFloat)y frameW:(CGFloat)width frameH:(CGFloat)height font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)color numberOfLines:(NSInteger)lines {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
    label.font = font;
    label.textAlignment = textAlignment;
    label.textColor = color;
    label.numberOfLines = lines;
//    CGSize size = [label sizeThatFits:CGSizeMake(width, height)];
//    [label setFrame:CGRectMake(x, y, size.width, size.height)];
    return label;
}

@end
