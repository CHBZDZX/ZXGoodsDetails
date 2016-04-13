//
//  MyTheViewController.m
//  ZXGoodsDetails-(模仿淘宝商品详情)
//
//  Created by zhaoxu on 16/3/21.
//  Copyright © 2016年 ZX. All rights reserved.
//

#import "MyTheViewController.h"

@interface MyTheViewController ()

@end

@implementation MyTheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.view.frame = CGRectMake(0, ZXSCREEN_HEIGHT-300, ZXSCREEN_WIDTH, 300);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
