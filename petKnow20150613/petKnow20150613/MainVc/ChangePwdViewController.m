//
//  ChangePwdViewController.m
//  petKnow20150613
//
//  Created by 左淑红 on 15/6/26.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "ChangePwdViewController.h"

@interface ChangePwdViewController ()
/**
 *  确定密码修改
 */
@property (strong, nonatomic) IBOutlet UIButton *sendBtn;

@property (strong, nonatomic) IBOutlet UITextField *presentPwdTextField;
@property (strong, nonatomic) IBOutlet UITextField *nowPwdTextField;


@end

@implementation ChangePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)sendBtnClicked:(id)sender {
    NSLog(@"确定");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
