//
//  httpTools.m
//  petKnow20150613
//
//  Created by 孟钰丰 on 15/6/26.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "httpTools.h"
#import <CommonCrypto/CommonDigest.h>

@implementation httpTools
- (BOOL)isNetworkAvailable{
    return  _myself.isReachable;
}

-(id)init{
    self = [super init];
    if(self)
    {
        _myself = [[MKNetworkEngine alloc] init];
    }
    return self;
}

- (MKNetworkOperation *)operationWithMethod:(HttpMethod)method parameter:(NSDictionary *)param action:(NSString *)actionString addressIndex:(NSInteger)index{
    if (method == HttpMethodGet) {
        return [self.myself operationWithURLString:@"" params:param httpMethod:@"Get" signFlag:NO];
    }else{
        return nil;
    }
    
    
    
}

- (void)runOperation:(MKNetworkOperation *)operation{
    [_myself enqueueOperation:operation];
}


@end
