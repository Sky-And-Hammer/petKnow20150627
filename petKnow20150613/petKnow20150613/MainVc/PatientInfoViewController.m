//
//  PatientInfoViewController.m
//  petKnow20150613
//
//  Created by 孟钰丰 on 15/6/26.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "PatientInfoViewController.h"
#import "PatientInfo0_Cell.h"
#import "DiagnosisInfo3_Cell.h"
#import "petKnowDefine.h"

@interface PatientInfoViewController ()

@end

@implementation PatientInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 240.f;
    }else{
        return 90.f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1){
        return 30.f;
    }
    return 0.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        PatientInfo0_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"patientInfo0_cell" forIndexPath:indexPath];
        
        return cell;
    }else{
        DiagnosisInfo3_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"diagnosisInfo3_cell" forIndexPath:indexPath];
        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - private methods
- (void)setupSubviews{
    self.view.backgroundColor = COLOR(230, 221, 219, 1);
}

@end
