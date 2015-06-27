//
//  ForgetPwdViewController.m
//  petKnow20150613
//
//  Created by 孟钰丰 on 15/6/15.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "ForgetPwdViewController.h"
#import "T_m_Tools.h"

@interface ForgetPwdViewController ()

@property (strong, nonatomic) IBOutlet UITextField *accountNumTextField;
@property (strong, nonatomic) IBOutlet UIButton *sendBtn;
@property (strong, nonatomic) IBOutlet UIButton *cancleBtn;

@end

@implementation ForgetPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sendBtnClicked:(id)sender {
    if (_accountNumTextField.text.length != 1) {
        [ProgressHUD showError:@"账号长度不对，请重新输入"];
    }else{
        [self performSegueWithIdentifier:@"forgetBtn2_success" sender:self];
    }
}
- (IBAction)cancleBtnClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - private methods
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([segue.identifier isEqualToString:@"forgetBtn2_success"]) {
//        id page = segue.destinationViewController;
//        [page setValue:_accountNumTextField.text forKey:@"username"];
//        
//    }
//}

- (void)setupSubview{
    self.navigationController.navigationBarHidden = NO;
}
@end
