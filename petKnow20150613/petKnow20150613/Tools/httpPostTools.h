//
//  httpPostTools.h
//  petKnow20150613
//
//  Created by 孟钰丰 on 15/6/29.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "httpTools.h"
@interface httpPostTools : httpTools
+ (httpPostTools *)sharedInstance;

- (void)doPostUploadWithParamentsonFinish:(httpToolsBlock)block;
@end
