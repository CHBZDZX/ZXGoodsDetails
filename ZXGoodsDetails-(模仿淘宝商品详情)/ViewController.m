//
//  ViewController.m
//  ZXGoodsDetails-(模仿淘宝商品详情)
//
//  Created by iMac on 16/3/17.
//  Copyright © 2016年 ZX. All rights reserved.
//

#import "ViewController.h"
#import "GoodsDetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *toDetail = [UIButton buttonWithType:UIButtonTypeCustom];
    toDetail.frame = CGRectMake(0, (ZXSCREEN_HEIGHT-40)/2, ZXSCREEN_WIDTH, 40);
    [toDetail setTitle:@"商品详情" forState:UIControlStateNormal];
    [toDetail setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [toDetail addTarget:self action:@selector(toDetails) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:toDetail];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)toDetails {
    GoodsDetailsViewController *goodsDetailsVC = [[GoodsDetailsViewController alloc] init];
    [self.navigationController pushViewController:goodsDetailsVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
