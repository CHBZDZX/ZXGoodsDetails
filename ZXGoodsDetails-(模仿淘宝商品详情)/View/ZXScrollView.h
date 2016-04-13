//
//  ZXScrollView.h
//  ZXGoodsDetails-(模仿淘宝商品详情)
//
//  Created by iMac on 16/3/17.
//  Copyright © 2016年 ZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZXScrollViewDelegate <NSObject>

- (void)pageControlReset:(NSInteger)aCount;

@end

@interface ZXScrollView : UIScrollView

@property (weak,nonatomic) id<ZXScrollViewDelegate> pageDelegate;

@property (assign,nonatomic) BOOL isCycle;//是否循环滚动  默认为NO不循环滚动
@property (assign,nonatomic) BOOL isAutomatic;//是否自动滚动  默认为NO不自动滚动  自动滚动模式下自动循环滚动

@property (strong,nonatomic) NSArray *imageArray;

@end
