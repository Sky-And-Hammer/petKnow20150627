//
//  httpGetTools.h
//  petKnow20150613
//
//  Created by 孟钰丰 on 15/6/26.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "httpTools.h"

@interface httpGetTools : httpTools
+ (httpGetTools *)sharedInstance;


/**
 *  get网络请求
 *
 *  @param paraments 所有参数 包括action。如需要md5 提前转换
 *  @param index     urlIndex
        0   -   http://m.dopetsknow.com/d/if/account.jhtml
        1   -   
        2   -   
        3   -   
 *  @param signFlag  是否需要sign参数。
 *  @param block     返回block
        block   -   (^httpToolsBlock)(BOOL isOk,id result,NSString* error);
 */
- (void)doGetWithParaments:(NSDictionary *)paraments addressIndex:(NSString *)index signFlag:(BOOL)signFlag onFinish:(httpToolsBlock)block;
@end
