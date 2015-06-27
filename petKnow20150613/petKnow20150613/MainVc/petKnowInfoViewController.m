//
//  petKnowInfoViewController.m
//  petKnow20150613
//
//  Created by 孟钰丰 on 15/6/19.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "petKnowInfoViewController.h"

@interface petKnowInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;

@end

@implementation petKnowInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
- (void)setupSubviews{
    _versionLabel.text = [NSString stringWithFormat:@"%@",@"v0.9.1"];
}

@end
