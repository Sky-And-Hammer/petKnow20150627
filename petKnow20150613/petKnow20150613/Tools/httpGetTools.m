//
//  httpGetTools.m
//  petKnow20150613
//
//  Created by 孟钰丰 on 15/6/26.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "httpGetTools.h"

@implementation httpGetTools
+ (httpGetTools *)sharedInstance{
    static dispatch_once_t onceToken;
    static httpGetTools *poster;
    dispatch_once(&onceToken, ^{
        poster = [[httpGetTools alloc] init];
    });
    
    return poster;
}

- (void)doGetWithParaments:(NSDictionary *)paraments addressIndex:(NSInteger )index signFlag:(BOOL)signFlag onFinish:(httpToolsBlock)block{
    NSString *addressUrl;
    NSMutableDictionary *endParmets = [NSMutableDictionary dictionaryWithDictionary:paraments];
    if (index == 0) {
        addressUrl = @"http://m.dopetsknow.com/d/if/account.jhtml";
        
    }else if (index == 2){
        NSString *url = @"http://123.57.226.86:8080/d/pet/";
        addressUrl = [NSString stringWithFormat:@"%@%@.json",url,[endParmets objectForKey:@"action"]];
        [endParmets removeObjectForKey:@"action"];
    }
    
    MKNetworkOperation *op = [self.myself operationWithURLString:addressUrl params:endParmets httpMethod:@"GET" signFlag:signFlag];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:completedOperation.responseData options:NSJSONReadingAllowFragments error:nil];
        
        NSNumber *i = [[dic objectForKey:@"result"] valueForKey:@"result"];
        
        if (i.integerValue == 1) {
//            NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:[dic objectForKey:@"extInfo"]];
//            for (id akey in [result allKeys]) {
//                NSLog(@"K = %@, V = %@",akey,[dic objectForKey:akey]);
//                id aValue = [result objectForKey:akey];
//                if ([akey isEqualToString:@"hospitalObj"]) {
//                    if ([aValue isKindOfClass:[NSArray class]] || [aValue isKindOfClass:[NSDictionary class]]) {
//                        NSLog(@"*******************************");
//                    }else{
//                        if (aValue == nil) {
//                            
//                        }
//                        
//                        if ([aValue isEqual:[NSNull null]]) {
//                            
//                        }
//                    }
//                }
//            }
            
            block(YES,dic,nil);
        }else{
            block(NO,dic,[[dic objectForKey:@"result"] objectForKey:@"reason"]);
        }

    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        block(FALSE,nil,@"服务器返回数据异常");
    }];
    
    
    [self runOperation:op];
    
    
}

- (void)doGetWithParaments:(NSDictionary *)paraments onFinish:(httpToolsBlock)block{
   
}
@end
