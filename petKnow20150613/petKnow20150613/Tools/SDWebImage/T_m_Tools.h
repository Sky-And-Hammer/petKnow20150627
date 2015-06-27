//
//  T_m_Tools.h
//  Chat2-14
//
//  Created by kiddopal on 15/5/8.
//  Copyright (c) 2015年 kiddopal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>

#import "SDImageCache.h"
#import "SDWebImageDownloaderOperation.h"
#import "httpGetTools.h"
#import "ProgressHUD.h"
//常用方法
//--------------------------------------------------
@interface T_m_Tools : NSObject

+ (void)setImageToDest:(BOOL )yes1 AndThumbnail:(BOOL )yes2 AndURL:(NSString *)url AndDefaultImage:(NSString *)imageName AndBlock:(void (^)(UIImage *))animations;
+ (NSString *)getTimeWithFormat:(NSString *)format;
+ (NSString *)md5HexDigest:(NSString*)input;

@end
