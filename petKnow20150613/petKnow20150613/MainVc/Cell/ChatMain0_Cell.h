//
//  ChatMain0_Cell.h
//  petKnow
//
//  Created by 孟钰丰 on 15/6/12.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatMain0_Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *conversationTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *conversationEndLabel;

@end
