//
//  LoginViewController.m
//  petKnow
//
//  Created by 孟钰丰 on 15/6/12.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "LoginViewController.h"
#import "httpGetTools.h"
#import "T_m_Tools.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *send = [NSMutableDictionary new];
    [send setObject:@"18611746169" forKey:@"username"];
    
    [send setObject:[T_m_Tools md5HexDigest:@"zhidao123"] forKey:@"password"];
    [send setObject:@"UserLogin" forKey:@"action"];
    
//    [[httpGetTools sharedInstance] doGetWithParaments:send addressIndex:0 signFlag:YES onFinish:^(BOOL isOk, id result, NSString *error) {
//        if (isOk) {
////            [NSUserDefaults standardUserDefaults] setObject:<#(id)#> forKey:<#(NSString *)#>
//            NSLog(@"%@",result);
//        }else{
//            NSLog(@"fail");
//        }
//    }];
    NSString *token = @"2754dc8992d0b40547fcb9aa1717a6c81435372888267";
    BOOL logined = YES;
    if (logined) {
        [self performSegueWithIdentifier:@"hadLogin_success" sender:self];
    }

    self.view.backgroundColor = [UIColor whiteColor];
    [self setupViews];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -private methods
-(void)setupViews {
    self.navigationController.navigationBarHidden = YES;
    
}



@end
