//
//  ChatMain0_Cell.m
//  petKnow
//
//  Created by 孟钰丰 on 15/6/12.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "ChatMain0_Cell.h"

@implementation ChatMain0_Cell

- (void)awakeFromNib {
    // Initialization code
    
    _headImageView.layer.cornerRadius = 25.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
