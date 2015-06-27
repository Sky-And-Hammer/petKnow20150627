//
//  LoginViewController.m
//  petKnow
//
//  Created by 孟钰丰 on 15/6/12.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "LoginViewController.h"
#import "T_m_Tools.h"
#import "petKnowDefine.h"
#import <pop/POP.h>

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self isLogined]) {
        [self performSegueWithIdentifier:@"hadLogin_success" sender:self];
    }else{
        [self setupViews];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_usernameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

- (IBAction)logionAction:(id)sender {
    if (_usernameTextField.text.length == 0 || _passwordTextField.text.length == 0) {
        [ProgressHUD showError:@"账号或密码必须全部填写"];
        [self shakeButton];
    }else if (_usernameTextField.text.length != 11){
        [ProgressHUD showError:@"账号长度有误，请重新输入"];
        [self shakeButton];
    }else if (_passwordTextField.text.length < 6 || _passwordTextField.text.length > 16){
        [ProgressHUD showError:@"密码是长度有误，请重新输入"];
        [self shakeButton];
    }else{
        [self loginFuntion];
    }
}
- (IBAction)forgetAction:(id)sender {
    
}
- (IBAction)registerAction:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    CGRect frame ;
    frame = _passwordTextField.frame;
    
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 216.0) + 50 + 50;
    
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:0.30f];
    
    if (offset > 0) {
        self.view.frame = CGRectMake(0, -offset, self.view.frame.size.width, self.view.frame.size.height);
    }
    
    [UIView commitAnimations];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:0.3f];
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
}

#pragma mark -private methods
- (void)shakeButton{
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    positionAnimation.velocity = @2000;
    positionAnimation.springBounciness = 20;
    [positionAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
        _loginButton.userInteractionEnabled = YES;
    }];
    [_loginButton.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
}

- (BOOL)isLogined{
    NSString *token = ACCOUNT_TOKEN;
    if (token.length == 0) {
        return NO;
    }
    
    return YES;
}

- (void)loginFuntion{
    NSMutableDictionary *send = [NSMutableDictionary new];
    [send setObject:_usernameTextField.text forKey:@"username"];
    [send setObject:[T_m_Tools md5HexDigest:_passwordTextField.text] forKey:@"password"];
    [send setObject:NETWORK_GET_LOGIN_A forKey:@"action"];
#warning deviceid for notification
    
    [[httpGetTools sharedInstance] doGetWithParaments:send addressIndex:0 signFlag:YES onFinish:^(BOOL isOk, id result, NSString *error) {
        if (isOk) {
            [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"token"] forKey:@"accountToken"];
            
            [self performSegueWithIdentifier:@"hadLogin_success" sender:self];
            
        }else{
            [ProgressHUD showError:error];
        }
    }];
    
}

-(void)setupViews {
    _usernameTextField.delegate = self;
    _passwordTextField.delegate = self;
    
    _loginButton.backgroundColor = COLOR(46, 204, 113, 1);
    _loginButton.layer.cornerRadius = 4.f;
    _registerButton.backgroundColor = COLOR(46, 204, 113, 1);
    _registerButton.layer.cornerRadius = 4.f;
}



@end
