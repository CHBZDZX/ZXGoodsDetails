//
//  ZXScrollView.m
//  ZXGoodsDetails-(模仿淘宝商品详情)
//
//  Created by iMac on 16/3/17.
//  Copyright © 2016年 ZX. All rights reserved.
//

#import "ZXScrollView.h"

@interface ZXScrollView () <UIScrollViewDelegate>

/**
 *  定时器
 */
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign)NSInteger imageCount;
@property (nonatomic, assign)NSInteger aCount;
@property(nonatomic,assign) float lastContentOffset;

@end

@implementation ZXScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.aCount = 0;
        self.imageCount = 0;
        self.isCycle = NO;
        self.isAutomatic = NO;
        self.delegate = self;
        self.pagingEnabled = YES;//YES  会自动滚动到 subview 的边界
        self.bounces = YES;//YES    滚动超过边界会反弹有反弹回来的效果
        self.showsHorizontalScrollIndicator = NO;//滚动时是否显示水平滚动条
        self.showsVerticalScrollIndicator = NO;//滚动时是否显示垂直滚动条
    }
    return self;
}

//是否自动滚动
- (void)setIsAutomatic:(BOOL)isAutomatic {
    _isAutomatic = isAutomatic;
    
    if (isAutomatic == YES) {
        self.isCycle = YES;
        self.aCount = 1;
        [self addTimer];
        self.contentOffset = CGPointMake(self.frame.size.width, 0);
    }
}

//是否循环滚动
- (void)setIsCycle:(BOOL)isCycle {
    _isCycle = isCycle;
    
    if (isCycle == YES) {
        self.aCount = 1;
        self.contentOffset = CGPointMake(self.frame.size.width, 0);
        self.contentSize = CGSizeMake(self.frame.size.width*(self.imageArray.count+2), self.frame.size.height);//里面内容的大小，也就是可以滚动的大小
        for (int i = 0; i < self.imageArray.count+2; i++) {
            if (i == 0) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0+self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
                imageView.image = [UIImage imageNamed:self.imageArray[self.imageArray.count-1]];
                imageView.tag = i+10000;
                [self addSubview:imageView];
            } else if (i == self.imageArray.count+1) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0+self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
                imageView.image = [UIImage imageNamed:self.imageArray[0]];
                imageView.tag = i+10000;
                [self addSubview:imageView];
            } else {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0+self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
                imageView.image = [UIImage imageNamed:self.imageArray[i-1]];
                imageView.tag = i+10000;
                [self addSubview:imageView];
            }
        }
    } else {
        if (self.isAutomatic == YES) {
            self.isCycle = YES;
            self.aCount = 1;
            self.contentOffset = CGPointMake(self.frame.size.width, 0);
            self.contentSize = CGSizeMake(self.frame.size.width*(self.imageArray.count+2), self.frame.size.height);//里面内容的大小，也就是可以滚动的大小
            for (int i = 0; i < self.imageArray.count+2; i++) {
                if (i == 0) {
                    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0+self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
                    imageView.image = [UIImage imageNamed:self.imageArray[self.imageArray.count-1]];
                    imageView.tag = i+10000;
                    [self addSubview:imageView];
                } else if (i == self.imageArray.count+1) {
                    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0+self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
                    imageView.image = [UIImage imageNamed:self.imageArray[0]];
                    imageView.tag = i+10000;
                    [self addSubview:imageView];
                } else {
                    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0+self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
                    imageView.image = [UIImage imageNamed:self.imageArray[i-1]];
                    imageView.tag = i+10000;
                    [self addSubview:imageView];
                }
            }
        } else {
            self.aCount = 0;
            self.contentOffset = CGPointMake(0, 0);
            self.contentSize = CGSizeMake(self.frame.size.width*self.imageArray.count, self.frame.size.height);//里面内容的大小，也就是可以滚动的大小
            for (int i = 0; i < self.imageArray.count; i++) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0+self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
                imageView.image = [UIImage imageNamed:self.imageArray[i]];
                imageView.tag = i+10000;
                [self addSubview:imageView];
            }
        }
    }
}

/**
 *  添加定时器
 */
- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)nextImage{
    if (self.aCount == 1) {
        [self setContentOffset:CGPointMake(self.frame.size.width*2, 0) animated:YES];
    } else if (self.aCount == self.imageCount+1) {
        [self setContentOffset:CGPointMake(self.frame.size.width*1, 0) animated:YES];
        self.aCount = 1;
    } else {
        [self setContentOffset:CGPointMake(self.frame.size.width*(self.aCount+1), 0) animated:YES];
    }
}

/**
 *  移除定时器
 */
- (void)removeTimer
{
    //停止定时器(一旦定时器停止了,就不能再使用)
    [self.timer invalidate];
    self.timer = nil;
}

- (void)setImageArray:(NSArray *)imageArray {
    _imageArray = imageArray;
    self.imageCount = imageArray.count;
    
    if (self.isCycle == NO) {
        self.contentSize = CGSizeMake(self.frame.size.width*imageArray.count, self.frame.size.height);//里面内容的大小，也就是可以滚动的大小
        for (int i = 0; i < imageArray.count; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0+self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
            imageView.image = [UIImage imageNamed:imageArray[i]];
            imageView.tag = i+10000;
            [self addSubview:imageView];
        }
    } else {
        self.contentSize = CGSizeMake(self.frame.size.width*(imageArray.count+2), self.frame.size.height);//里面内容的大小，也就是可以滚动的大小
        for (int i = 0; i < imageArray.count+2; i++) {
            if (i == 0) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0+self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
                imageView.image = [UIImage imageNamed:imageArray[imageArray.count-1]];
                imageView.tag = i+10000;
                [self addSubview:imageView];
            } else if (i == imageArray.count+1) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0+self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
                imageView.image = [UIImage imageNamed:imageArray[0]];
                imageView.tag = i+10000;
                [self addSubview:imageView];
            } else {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0+self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
                imageView.image = [UIImage imageNamed:imageArray[i-1]];
                imageView.tag = i+10000;
                [self addSubview:imageView];
            }
        }
    }
}

#pragma mark --UIScrollViewDelegate
/**
 *  开始拖拽的时候调用
 */
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // 停止定时器(一旦定时器停止了,就不能再使用)
    [self removeTimer];
    self.lastContentOffset = scrollView.contentOffset.x;
}

/**
 *  停止拖拽的时候调用
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (self.isAutomatic == YES) {
        // 开启定时器
        [self addTimer];
    }
}

//停止减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self resetWithScrollView:scrollView];
}
//停止动画
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self resetWithScrollView:scrollView];
}

- (void)resetWithScrollView:(UIScrollView *)scrollView {
    if (self.isCycle == YES) {
        if (self.lastContentOffset < scrollView.contentOffset.x) {
            NSLog(@"向右滚动");
            if (self.aCount != self.imageCount+1) {
                self.aCount++;
                [self setContentOffset:CGPointMake(self.frame.size.width*self.aCount, 0) animated:YES];
                if (self.aCount == self.imageCount+1) {
                    [self setContentOffset:CGPointMake(self.frame.size.width*1, 0) animated:NO];
                    self.aCount = 1;
                }
            }
        }else if(scrollView.contentOffset.x < self.lastContentOffset){
            NSLog(@"向左滚动");
            NSLog(@"aCount:%ld", (long)self.aCount);
            if (self.aCount != 0) {
                self.aCount--;
                [self setContentOffset:CGPointMake(self.frame.size.width*self.aCount, 0) animated:YES];
                if (self.aCount == 0) {
                    [self setContentOffset:CGPointMake(self.frame.size.width*self.imageCount, 0) animated:NO];
                    self.aCount = self.imageCount;
                }
            }
        }
        if ([self.pageDelegate respondsToSelector:@selector(pageControlReset:)]) {
            [self.pageDelegate pageControlReset:self.aCount-1];
        }
    } else {
        if (self.lastContentOffset < scrollView.contentOffset.x) {
            NSLog(@"向右滚动");
            if (self.aCount != self.imageCount-1) {
                self.aCount++;
                [self setContentOffset:CGPointMake(self.frame.size.width*self.aCount, 0) animated:YES];
            }
        }else if(scrollView.contentOffset.x < self.lastContentOffset){
            NSLog(@"向左滚动");
            NSLog(@"aCount:%ld", (long)self.aCount);
            if (self.aCount != 0) {
                self.aCount--;
                [self setContentOffset:CGPointMake(self.frame.size.width*self.aCount, 0) animated:YES];
            }
        }
        if ([self.pageDelegate respondsToSelector:@selector(pageControlReset:)]) {
            [self.pageDelegate pageControlReset:self.aCount];
        }
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
