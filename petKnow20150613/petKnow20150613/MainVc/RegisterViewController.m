//
//  RegisterViewController.m
//  petKnow20150613
//
//  Created by 孟钰丰 on 15/6/15.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "RegisterViewController.h"
#import "petKnowDefine.h"

@interface RegisterViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *verificationTextField;

@property (weak, nonatomic) IBOutlet UIButton *agreeButton;
@property (weak, nonatomic) IBOutlet UIButton *protocolButton;
@property (weak, nonatomic) IBOutlet UIButton *sendVvericationButton;
@property (strong, nonatomic) IBOutlet UIButton *cancelBtn;
@property (strong, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubview];
}

- (IBAction)registerAction:(id)sender {
}

- (IBAction)cancelAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - private methods
- (void)setupSubview{
    _usernameTextField.delegate = self;
    _passwordTextField.delegate = self;
    
    _registerBtn.backgroundColor = COLOR(46, 204, 113, 1);
    _registerBtn.layer.cornerRadius = 4.f;
    _agreeButton.backgroundColor = COLOR(46, 204, 113, 1);
    _agreeButton.layer.cornerRadius = 4.f;
    _sendVvericationButton.backgroundColor = COLOR(46, 204, 113, 1);
    _sendVvericationButton.layer.cornerRadius = 4.f;
    _cancelBtn.backgroundColor = COLOR(46, 204, 113, 1);
    _cancelBtn.layer.cornerRadius = 4.f;
}

@end
