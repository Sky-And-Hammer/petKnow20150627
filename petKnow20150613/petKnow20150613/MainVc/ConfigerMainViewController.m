//
//  ConfigerMainViewController.m
//  petKnow20150613
//
//  Created by 孟钰丰 on 15/6/19.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "ConfigerMainViewController.h"
#import "MyAccount_Configer0_Cell.h"
#import "ProgressHUD.h"

@interface ConfigerMainViewController ()<UIAlertViewDelegate>

@end

@implementation ConfigerMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex != 0) {
        [ProgressHUD showSuccess:@"退出成功"];
    }
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyAccount_Configer0_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"myAccount_configer0_cell" forIndexPath:indexPath];

    if (indexPath.row == 0) {
        cell.titleLabel.text = @"修改密码";
    }else if (indexPath.row == 1){
        cell.titleLabel.text = @"意见反馈";
        cell.subtitleLabel.text = [NSString stringWithFormat:@"%@条反馈信息",@"2"];
    }else if (indexPath.row == 2){
        cell.titleLabel.text = @"账号登出";
    }else if (indexPath.row == 3){
        cell.titleLabel.text = @"检查升级";
    } else if (indexPath.row == 4) {
        cell.titleLabel.text = @"关于宠知道";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"changePwd_success" sender:self];
    }else if (indexPath.row == 1){
        [self performSegueWithIdentifier:@"retroaction_success" sender:self];
    }else if (indexPath.row == 2){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"确认是否退出" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
        [alert show];
        
    }else if (indexPath.row == 3){
        [self performSegueWithIdentifier:@"petKnowInfo_success" sender:self];
    }
}

@end
