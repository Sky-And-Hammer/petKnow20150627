//
//  ForgetPwdViewController.m
//  petKnow20150613
//
//  Created by 孟钰丰 on 15/6/15.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "ForgetPwdViewController.h"

@interface ForgetPwdViewController ()

@property (strong, nonatomic) IBOutlet UITextField *accountNumTextField;
@property (strong, nonatomic) IBOutlet UIView *line;
@property (strong, nonatomic) IBOutlet UIButton *sendBtn;
@property (strong, nonatomic) IBOutlet UIButton *cancleBtn;

@end

@implementation ForgetPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sendBtnClicked:(id)sender {
    NSLog(@"确定");
}
- (IBAction)cancleBtnClicked:(id)sender {
    NSLog(@"取消");
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
