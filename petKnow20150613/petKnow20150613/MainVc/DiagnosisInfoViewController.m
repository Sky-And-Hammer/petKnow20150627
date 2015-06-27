//
//  DiagnosisInfoViewController.m
//  petKnow20150613
//
//  Created by 孟钰丰 on 15/6/14.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "DiagnosisInfoViewController.h"
#import "DiagnosisInfo0_Cell.h"
#import "DiagnosisInfo1_Cell.h"
#import "DiagnosisInfo2_Cell.h"
#import "DiagnosisInfo3_Cell.h"

@interface DiagnosisInfoViewController ()

@end

@implementation DiagnosisInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 3) {
        return 4;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 || indexPath.section == 1) {
        return 120.f;
    }else if (indexPath.section == 2){
        return 180.f;
    }else{
        return  75.f;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        DiagnosisInfo0_Cell *cell = (DiagnosisInfo0_Cell *)[tableView dequeueReusableCellWithIdentifier:@"diagnosisInfo0_cell" forIndexPath:indexPath];
        
        return cell;
    }else if (indexPath.section == 1){
        DiagnosisInfo1_Cell *cell = (DiagnosisInfo1_Cell *)[tableView dequeueReusableCellWithIdentifier:@"diagnosisInfo1_cell" forIndexPath:indexPath];
        
        return cell;
    }else if (indexPath.section == 2){
        DiagnosisInfo2_Cell *cell = (DiagnosisInfo2_Cell *)[tableView dequeueReusableCellWithIdentifier:@"diagnosisInfo2_cell" forIndexPath:indexPath];
        
        return cell;
    }else if (indexPath.section == 3){
        DiagnosisInfo3_Cell *cell = (DiagnosisInfo3_Cell *)[tableView dequeueReusableCellWithIdentifier:@"diagnosisInfo3_cell" forIndexPath:indexPath];
        
        return cell;
    }
    
    return nil;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
