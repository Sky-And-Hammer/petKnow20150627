//
//  MyAccountViewController.m
//  petKnow20150613
//
//  Created by kiddopal on 15/6/18.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "MyAccountViewController.h"
#import "petKnowDefine.h"
#import "MyAccount0_Cell.h"
#import "MyAccount1_Cell.h"
#import "MyAccount2_Cell.h"
#import "MJRefresh.h"

@interface MyAccountViewController ()
@property (strong, nonatomic) IBOutlet UITableView *sharedInstanceView;

@end

@implementation MyAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    
    [self setupSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)configerAction:(id)sender {
    NSLog(@"2");
    [self performSegueWithIdentifier:@"configer_success" sender:self];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else{
        return 8;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 60;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    backgroundView.backgroundColor = COLOR(44, 189, 164, 1);
    NSArray *arr = @[@"6人", @"5.0分", @"19.0%"];
    NSArray *arr1 = @[@"已接诊", @"综合评价", @"超越同行"];
    for (int i = 0; i < arr.count; i++) {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0 + (backgroundView.frame.size.width / 3 * i), 0, backgroundView.frame.size.width / 3, backgroundView.frame.size.height / 2)];
        lab.textColor = [UIColor whiteColor];
        lab.text = arr[i];
        lab.textAlignment = NSTextAlignmentCenter;
        [backgroundView addSubview:lab];
        
        UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(0 + (backgroundView.frame.size.width / 3 * i), backgroundView.frame.size.height / 2, backgroundView.frame.size.width / 3, backgroundView.frame.size.height / 2)];
        lab1.textColor = [UIColor whiteColor];
        lab1.text = arr1[i];
        lab1.textAlignment = NSTextAlignmentCenter;
        [backgroundView addSubview:lab1];
        
    }
    
    
    return backgroundView;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        return nil;
    }
    return indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 230;
    }else{
        /**
         *  根据手机不同，cell高度不同
         *  4,4s,5,5s   71
         *  6           92-10x
         *  6p          同上
         */
        return 87;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MyAccount0_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"myAccount0_cell" forIndexPath:indexPath];
        
        UITapGestureRecognizer *headImageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageTapAction:)];
        cell.headImageView.userInteractionEnabled = YES;
        [cell.headImageView addGestureRecognizer:headImageTap];
        
        return cell;
    }else if (indexPath.section == 1){
        MyAccount1_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"myAccount1_cell" forIndexPath:indexPath];
        
        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UIGestureRecognizer
- (void)headImageTapAction:(UITapGestureRecognizer *)sender{
    NSLog(@"2");
    [self performSegueWithIdentifier:@"accountInfo_success" sender:self];
}

#pragma mark - private method
- (void)refreshDataSource{
    [_sharedInstanceView.header endRefreshing];
    [_sharedInstanceView.footer endRefreshing];
}

- (void)setupSubviews{
    __weak typeof(self) weakSelf = self;
    [_sharedInstanceView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf refreshDataSource];
    }];
    [_sharedInstanceView addLegendFooterWithRefreshingBlock:^{
        [weakSelf refreshDataSource];
    }];
}

@end
