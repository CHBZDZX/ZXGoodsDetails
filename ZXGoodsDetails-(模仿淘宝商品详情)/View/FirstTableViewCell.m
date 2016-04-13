//
//  FirstTableViewCell.m
//  ZXGoodsDetails-(模仿淘宝商品详情)
//
//  Created by zhaoxu on 16/3/21.
//  Copyright © 2016年 ZX. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"firstCell";
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[FirstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = ZXColor(234, 234, 234);
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ZXSCREEN_WIDTH, 50)];
        backView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:backView];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
