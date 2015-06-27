//
//  WaitDiagnosis0_Cell.h
//  petKnow20150613
//
//  Created by 孟钰丰 on 15/6/14.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaitDiagnosis0_Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *petInfoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *petSexImageView;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UIImageView *petImageView;
@property (weak, nonatomic) IBOutlet UILabel *waitTimeLabel;

@end
