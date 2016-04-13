//
//  ZXHeadViewTwo.m
//  ZXGoodsDetails-(模仿淘宝商品详情)
//
//  Created by iMac on 16/3/17.
//  Copyright © 2016年 ZX. All rights reserved.
//

#import "ZXHeadViewTwo.h"

@implementation ZXHeadViewTwo

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLabel = [UILabel labelWithFrameX:10 frameY:10 frameW:ZXSCREEN_WIDTH-70 frameH:40 font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentLeft textColor:[UIColor blackColor] numberOfLines:0];
        titleLabel.text = @"2016春季小西装 男复古休闲西服 韩版青年一粒扣修身单西 男外套";
        [self addSubview:titleLabel];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(ZXSCREEN_WIDTH-60, 10, 1, 40)];
        lineView.backgroundColor = ZXColor(230, 230, 230);
        [self addSubview:lineView];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(ZXSCREEN_WIDTH-40, 10, 20, 20)];
        imageView.backgroundColor = [UIColor redColor];
        [self addSubview:imageView];
        
        UILabel *fenxiang = [UILabel labelWithFrameX:ZXSCREEN_WIDTH-60 frameY:30 frameW:60 frameH:20 font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentCenter textColor:[UIColor blackColor] numberOfLines:1];
        fenxiang.text = @"分享";
        [self addSubview:fenxiang];
        
        UIButton *fenxiangBtn = [UIButton buttonWithType:UIButtonTypeCustom frameX:ZXSCREEN_WIDTH-60 frameY:0 frameW:60 frameH:60 buttonNormalImage:nil buttonSelectedImage:nil];
        [fenxiangBtn addTarget:self action:@selector(fenxiangBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:fenxiangBtn];
        
        UILabel *jiage = [UILabel labelWithFrameX:10 frameY:CGRectGetMaxY(titleLabel.frame)+5 frameW:60 frameH:30 font:[UIFont systemFontOfSize:25] textAlignment:NSTextAlignmentLeft textColor:[UIColor orangeColor] numberOfLines:1];
        jiage.text = @"¥ 79";
        [self addSubview:jiage];
        
        UILabel *xian = [UILabel labelWithFrameX:CGRectGetMaxX(jiage.frame)+10 frameY:CGRectGetMaxY(titleLabel.frame)+5+9 frameW:60 frameH:15 font:[UIFont systemFontOfSize:10] textAlignment:NSTextAlignmentCenter textColor:[UIColor whiteColor] numberOfLines:1];
        xian.backgroundColor = [UIColor redColor];
        xian.text = @"新品限量抢";
        [self addSubview:xian];
        
        UILabel *di = [UILabel labelWithFrameX:CGRectGetMaxX(xian.frame)+5 frameY:CGRectGetMaxY(titleLabel.frame)+5+9 frameW:60 frameH:15 font:[UIFont systemFontOfSize:10] textAlignment:NSTextAlignmentCenter textColor:[UIColor whiteColor] numberOfLines:1];
        di.backgroundColor = [UIColor orangeColor];
        di.text = @"淘金币抵2%";
        [self addSubview:di];
        
        UILabel *yuanjia = [UILabel labelWithFrameX:10 frameY:CGRectGetMaxY(jiage.frame)+10 frameW:ZXSCREEN_WIDTH frameH:20 font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentLeft textColor:ZXColor(145, 145, 145) numberOfLines:1];
        yuanjia.text = @"价格¥598";
        [self addSubview:yuanjia];
        
        UILabel *kuaidi = [UILabel labelWithFrameX:10 frameY:CGRectGetMaxY(yuanjia.frame)+10 frameW:ZXSCREEN_WIDTH frameH:20 font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentLeft textColor:ZXColor(165, 165, 165) numberOfLines:1];
        kuaidi.text = @"快递：免运费";
        [self addSubview:kuaidi];
        
        UILabel *miaoshu = [UILabel labelWithFrameX:0 frameY:CGRectGetMaxY(kuaidi.frame) frameW:ZXSCREEN_WIDTH frameH:40 font:[UIFont systemFontOfSize:17] textAlignment:NSTextAlignmentLeft textColor:[UIColor lightGrayColor] numberOfLines:1];
        miaoshu.backgroundColor = ZXColor(245, 245, 245);
        miaoshu.text = @"   sdjfakl;jlkas;djflk;asjdfkl;a";
        [self addSubview:miaoshu];
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(miaoshu.frame), ZXSCREEN_WIDTH, 10)];
        bottomView.backgroundColor = ZXColor(234, 234, 234);
        [self addSubview:bottomView];
    }
    return self;
}

- (void)fenxiangBtn {
    NSLog(@"分享");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
