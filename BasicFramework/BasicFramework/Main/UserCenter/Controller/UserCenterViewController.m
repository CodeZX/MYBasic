//
//  UserCenterViewController.m
//  BasicFramework
//
//  Created by apple on 2018/5/2.
//  Copyright © 2018年 Rainy. All rights reserved.
//

#import "UserCenterViewController.h"
#import "UserCenterTableViewCell.h"
#import "UserCenterTableViewCellModel.h"


@interface UserCenterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,weak) UIImageView *headImageView;
@property (nonatomic,strong) NSMutableArray *dataSurceAry;

@end

@implementation UserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}


- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
  
     self.automaticallyAdjustsScrollViewInsets  = NO;
    
    UITableView *tableView = [[UITableView alloc]init];
    if (@available(iOS 11.0, *)) {
//        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        self.additionalSafeAreaInsets = UIEdgeInsetsMake(64, 0, 0, 0);
    } else {
       
    }
    tableView.delegate = self;
    tableView.dataSource = self;
//    tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.right.bottom.equalTo(self.view);
    }];
    tableView.backgroundColor  = RandomColor;
    
//    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
//    [self.view addSubview:imageView];
//    self.headImageView = imageView;
//    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view);
//        make.top.equalTo(self.view);
//        //        make.right.equalTo(self.view);
//        //        make.bottom.equalTo(self.view);
//        make.height.equalTo(200);
//        make.width.equalTo(SCREEN_WIDTH);
//    }];
//
//    imageView.backgroundColor = RedColor;

   
}

#pragma mark -------------------------- UItableview dataSource ----------------------------------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSurceAry.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 88;
}

#pragma mark -------------------------- UItbleView delegate ----------------------------------------

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Identifier = @"UserCenterTableViewCell";
    UserCenterTableViewCell *cell = [UserCenterTableViewCell cellWithTableView:tableView Identifier:Identifier];
    cell.model = self.dataSurceAry[indexPath.row];
    return cell;
    
}

#pragma mark -------------------------- scrollView dalegate ----------------------------------------

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    int contentOffsety = scrollView.contentOffset.y;
    
//    if (scrollView.contentOffset.y<=170) {
//        self.NavView.headBackView.alpha = scrollView.contentOffset.y/170;
//        self.NavView.left_bt_Image = @"left_";
//        self.NavView.right_bt_Image = @"Setting";
//        self.NavView.color = [UIColor whiteColor];
//
//        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
//    }else{
//        self.NavView.headBackView.alpha = 1;
//
//        self.NavView.left_bt_Image = @"left@3x.png";
//        self.NavView.right_bt_Image = @"Setting_";
//        self.NavView.color = kColor(87, 173, 104, 1);
//        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
//    }
    if (contentOffsety<0) {
//        CGRect rect = _backgroundImgV.frame;
//        rect.size.height = _backImgHeight-contentOffsety;
//        rect.size.width = _backImgWidth* (_backImgHeight-contentOffsety)/_backImgHeight;
//        rect.origin.x =  -(rect.size.width-_backImgWidth)/2;
//        rect.origin.y = 0;
//        _backgroundImgV.frame = rect;
        
//        CGFloat scale = -contentOffsety/200.0;
//        self.headImageView.transform = CGAffineTransformMakeScale( 1 + scale, 1 + scale);
    }else{
//        CGRect rect = _backgroundImgV.frame;
//        rect.size.height = _backImgHeight;
//        rect.size.width = _backImgWidth;
//        rect.origin.x = 0;
//        rect.origin.y = -contentOffsety;
//        _backgroundImgV.frame = rect;
        
    }
}
#pragma mark -------------------------- lazy load ----------------------------------------

- (NSMutableArray *)dataSurceAry {
    
    if (!_dataSurceAry) {
        
        _dataSurceAry = [[NSMutableArray alloc]init];
        UserCenterTableViewCellModel *model1 = [[UserCenterTableViewCellModel alloc]init];
        model1.title = @"model1";
        model1.actionBlock = ^(id cell) {
            NSLog(@"%@",@"model1");
        };
         [_dataSurceAry addObject:model1];
        UserCenterTableViewCellModel *model2 = [[UserCenterTableViewCellModel alloc]init];
        model2.title = @"model2";
        model2.actionBlock = ^(id cell) {
            NSLog(@"%@",@"model2");
        };
        [_dataSurceAry addObject:model2];
    }
    
    return _dataSurceAry;
}

@end
