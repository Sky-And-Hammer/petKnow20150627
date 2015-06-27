//
//  httpTools.h
//  petKnow20150613
//
//  Created by 孟钰丰 on 15/6/26.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKNetworkEngine.h"

typedef void (^httpToolsBlock)(BOOL isOk,id result,NSString* error);

typedef enum : NSUInteger {
    HttpMethodPost,
    HttpMethodGet,
} HttpMethod;

@interface httpTools : NSObject
@property(nonatomic,strong) MKNetworkEngine *myself;

//网络可行
- (BOOL)isNetworkAvailable;

//初始化
- (id)init;

//生成operation
- (MKNetworkOperation *)operationWithMethod:(HttpMethod)method parameter:(NSDictionary *)param action:(NSString *)actionString addressIndex:(NSInteger) index;

//把opeartion加入到队列中
- (void)runOperation:(MKNetworkOperation*)operation;



@end
