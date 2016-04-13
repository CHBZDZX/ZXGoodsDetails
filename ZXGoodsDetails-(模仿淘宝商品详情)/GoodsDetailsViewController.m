//
//  GoodsDetailsViewController.m
//  ZXGoodsDetails-(模仿淘宝商品详情)
//
//  Created by iMac on 16/3/17.
//  Copyright © 2016年 ZX. All rights reserved.
//

#import "GoodsDetailsViewController.h"
#import "FirstTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "MyTheViewController.h"

@interface GoodsDetailsViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak,nonatomic) UIButton *naviBtn;
@property (weak,nonatomic) ZXGoodsDetailsHeadView *goodsDetailsHeadView;
@property(nonatomic,assign) float lastContentOffset;

@end

@implementation GoodsDetailsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.alpha = 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lastContentOffset = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *cebian = [UIButton buttonWithType:UIButtonTypeCustom];
    cebian.frame = CGRectMake(0, 0, 15, 15);
    [cebian addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [cebian setImage:[UIImage imageNamed:@"t3-r"] forState:UIControlStateNormal];
    UIBarButtonItem *cebianItem=[[UIBarButtonItem alloc]initWithCustomView:cebian];
    self.navigationItem.leftBarButtonItem=cebianItem;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20-64, ZXSCREEN_WIDTH, ZXSCREEN_HEIGHT+20+64)];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.backgroundColor = ZXColor(234, 234, 234);
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
    
    UIButton *naviBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    naviBtn.frame = CGRectMake(16, 33, 15, 15);
    [naviBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [naviBtn setImage:[UIImage imageNamed:@"t3-r"] forState:UIControlStateNormal];
    [self.view addSubview:naviBtn];
    self.naviBtn = naviBtn;
    
    ZXGoodsDetailsHeadView *goodsDetailsHeadView = [[ZXGoodsDetailsHeadView alloc] initWithFrame:CGRectMake(0, 0, ZXSCREEN_WIDTH, 64+350+190)];
    tableView.tableHeaderView = goodsDetailsHeadView;
    self.goodsDetailsHeadView = goodsDetailsHeadView;
    
    // You can optionally listen to notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(semiModalPresented:)
                                                 name:kSemiModalDidShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(semiModalDismissed:)
                                                 name:kSemiModalDidHideNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(semiModalResized:)
                                                 name:kSemiModalWasResizedNotification
                                               object:nil];
    // Do any additional setup after loading the view.
}

#pragma mark - Optional notifications
- (void) semiModalResized:(NSNotification *) notification {
    if(notification.object == self){
        NSLog(@"The view controller presented was been resized");
    }
}

- (void)semiModalPresented:(NSNotification *) notification {
    if (notification.object == self) {
        NSLog(@"This view controller just shown a view with semi modal annimation");
    }
}

- (void)semiModalDismissed:(NSNotification *) notification {
    if (notification.object == self) {
        NSLog(@"A view controller was dismissed with semi modal annimation");
    }
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 60;
    } else{
        return 200;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell *cell = [FirstTableViewCell cellWithTableView:tableView];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self presentSemiViewController:[MyTheViewController new] withOptions:@{
                                                         KNSemiModalOptionKeys.pushParentBack    : @(YES),
                                                         KNSemiModalOptionKeys.animationDuration : @(0.6),
                                                         KNSemiModalOptionKeys.shadowOpacity     : @(0.3),
                                                         }];
}

#pragma mark --UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y-20 <= 286-46) {
        self.navigationController.navigationBar.alpha = (scrollView.contentOffset.y-20)/(286-46);
        self.naviBtn.alpha = 1-(scrollView.contentOffset.y-20)/(286-46);
    }
    self.goodsDetailsHeadView.lastContentOffset = scrollView.contentOffset.y;
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
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
