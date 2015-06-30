//
//  httpPostTools.m
//  petKnow20150613
//
//  Created by 孟钰丰 on 15/6/29.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "httpPostTools.h"

@implementation httpPostTools
+ (httpPostTools *)sharedInstance{
    static dispatch_once_t onceToken;
    static httpPostTools *poster;
    dispatch_once(&onceToken, ^{
        poster = [[httpPostTools alloc] init];
    });
    
    return poster;
}

@end
