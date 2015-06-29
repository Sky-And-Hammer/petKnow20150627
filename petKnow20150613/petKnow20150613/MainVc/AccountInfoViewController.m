//
//  AccountInfoViewController.m
//  petKnow20150613
//
//  Created by 孟钰丰 on 15/6/26.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "AccountInfoViewController.h"
#import "AccountInfo0_Cell.h"
#import "AccountInfo1_Cell.h"
#import "AccountInfo2_Cell.h"
#import "petKnowDefine.h"

@interface AccountInfoViewController ()<UIActionSheetDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSMutableDictionary *dataSource;
    BOOL didChanged;
}
@property (strong, nonatomic) IBOutlet UITableView *sharedInstanceView;
@end

@implementation AccountInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = COLOR(241, 241, 243, 1);
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
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 5;
    }else if (section == 2){
        return 1;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 181.f;
    }else if (indexPath.section == 1){
        return 40.f;
    }else{
        return 45.f;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        AccountInfo0_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"accountInfo0_cell" forIndexPath:indexPath];
        UITapGestureRecognizer *headImageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageTapAction:)];
        cell.headImageView.userInteractionEnabled = YES;
        [cell.headImageView addGestureRecognizer:headImageTap];
        
        return cell;
    }else if (indexPath.section == 2){
        AccountInfo2_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"accountInfo2_cell" forIndexPath:indexPath];
        
        return cell;
    }else{
        AccountInfo1_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"accountInfo1_cell" forIndexPath:indexPath];
        if (indexPath.row == 0) {
            cell.titleLabel.text = @"所属医院";
            [cell.contentLabel setTitle:@"A" forState:UIControlStateNormal];
            cell.contentLabel.tag = 0;
        }else if (indexPath.row == 1){
            cell.titleLabel.text = @"职位职称";
            [cell.contentLabel setTitle:@"B" forState:UIControlStateNormal];
            cell.contentLabel.tag = 1;
        }else if (indexPath.row == 2){
            cell.titleLabel.text = @"兽医资格证";
            [cell.contentLabel setTitle:@"C" forState:UIControlStateNormal];
            cell.contentLabel.tag = 2;
        }else if (indexPath.row == 3){
            cell.titleLabel.text = @"兽医执业证";
            [cell.contentLabel setTitle:@"D" forState:UIControlStateNormal];
            cell.contentLabel.tag = 3;
        }else if (indexPath.row == 4){
            cell.titleLabel.text = @"所在城市";
            [cell.contentLabel setTitle:@"E" forState:UIControlStateNormal];
            cell.contentLabel.tag = 4;
        }
        
        return cell;
    }
    
    return nil;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        return nil;
    }
    return indexPath;
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",(long)buttonIndex);
    if (actionSheet.tag == 10001) {
        NSUInteger sourceType = 0;
        switch (buttonIndex) {
            case 0:
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                break;
            case 1:
                sourceType = UIImagePickerControllerSourceTypeCamera;
                break;
            default:
                break;
        }
        
        UIImagePickerController *imageControlelr = [[UIImagePickerController alloc] init];
        imageControlelr.delegate = self;
        imageControlelr.allowsEditing = YES;
        imageControlelr.sourceType = sourceType;
        
        [self presentViewController:imageControlelr animated:YES completion:^{
            
        }];
    }else if (actionSheet.tag == 10003){
        
    }
}
#pragma mark - UIAlertViewDelegate
- (IBAction)sendClickAction:(id)sender {
    
}

#pragma mark - UIGestureRecognizer

- (IBAction)tableViewCellButtonClickAction:(id)sender{
    UIButton *button = (UIButton *)sender;
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:button.tag inSection:1];
    AccountInfo1_Cell *cell = (AccountInfo1_Cell *)[_sharedInstanceView cellForRowAtIndexPath:indexpath];
    cell.contentLabel.backgroundColor = [UIColor redColor];
    
    if (button.tag == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"所属医院" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        alert.tag = 10002;
        [alert show];
    }else if (button.tag == 1){
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"职位职称" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"院长",@"主治医师",@"助理医师", nil];
        actionSheet.tag = 10003;
        [actionSheet showInView:self.view];
        
    }else if (button.tag == 2){
        
    }else if (button.tag == 3){
        
    }else if (button.tag == 4){
        
    }
}

- (void)headImageTapAction:(UITapGestureRecognizer *)sender{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"请选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相册",@"照相", nil];
    actionSheet.tag = 10001;
    [actionSheet showInView:self.view];
}

#pragma mark - private methods
- (void)setupSubviews{
    dataSource = [NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] objectForKey:@""]];
    
    _sharedInstanceView.allowsSelection = NO;
}
@end
