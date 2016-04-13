//
//  ZXGoodsDetailsHeadView.m
//  ZXGoodsDetails-(模仿淘宝商品详情)
//
//  Created by iMac on 16/3/17.
//  Copyright © 2016年 ZX. All rights reserved.
//

#import "ZXGoodsDetailsHeadView.h"
#import "ZXScrollView.h"
#import "ZXHeadViewTwo.h"

@interface ZXGoodsDetailsHeadView () <ZXScrollViewDelegate>

@property (weak,nonatomic) UIImageView *imageView;
@property (weak,nonatomic) UILabel *refreshLabel;
@property (weak,nonatomic) UIPageControl *pageControl;

@end

@implementation ZXGoodsDetailsHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = ZXColor(234, 234, 234);
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"refresh"];
        [self addSubview:imageView];
        self.imageView = imageView;
        
        UILabel *refreshLabel = [[UILabel alloc] init];
        refreshLabel.font = [UIFont systemFontOfSize:14];
        refreshLabel.textColor = [UIColor blackColor];
        refreshLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:refreshLabel];
        self.refreshLabel = refreshLabel;
        
        ZXScrollView *scrollView = [[ZXScrollView alloc] initWithFrame:CGRectMake(0, 64, ZXSCREEN_WIDTH, 350)];
        NSArray *imageArray = @[@"设计师图片",@"设计师图片",@"设计师图片",@"设计师图片",@"设计师图片",@"设计师图片"];
        scrollView.imageArray = imageArray;
        scrollView.pageDelegate = self;
        scrollView.isAutomatic = NO;//如果需要在scrollView上添加上下拉，就需要全部设置为NO
        scrollView.isCycle = NO;
        [self addSubview:scrollView];
        
        UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(scrollView.frame)-24, ZXSCREEN_WIDTH, 14)];
        pageControl.backgroundColor = [UIColor clearColor];
        pageControl.numberOfPages = imageArray.count;
        pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
        pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        pageControl.currentPage = 0;
        [self addSubview:pageControl];
        self.pageControl = pageControl;
        
        ZXHeadViewTwo *headView = [[ZXHeadViewTwo alloc] initWithFrame:CGRectMake(0, 350, ZXSCREEN_WIDTH, 190)];
        [self addSubview:headView];
    }
    return self;
}

- (void)setLastContentOffset:(float)lastContentOffset {
    _lastContentOffset = lastContentOffset;
    
    if (lastContentOffset < -95.000000) {
        self.refreshLabel.text = @"释放查看更多精彩";
    } else {
        self.refreshLabel.text = @"下拉查看更多精彩";
    }
    CGSize size = [self.refreshLabel sizeThatFits:CGSizeMake(ZXSCREEN_WIDTH, 20)];
    self.imageView.frame = CGRectMake((ZXSCREEN_WIDTH-28-size.width)/2, 25, 14, 14);
    self.refreshLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame)+14, 0, size.width, 64);
    
    if (lastContentOffset <= -50.000000 && lastContentOffset >= -95.000000) {
        self.imageView.transform = CGAffineTransformMakeRotation(((-lastContentOffset)-50)/45*M_PI);
//        self.imageView.transform = CGAffineTransformRotate(<#CGAffineTransform t#>, <#CGFloat angle#>);
    }
}

#pragma mark --ZXScrollViewDelegate
- (void)pageControlReset:(NSInteger)aCount {
    self.pageControl.currentPage = aCount;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
