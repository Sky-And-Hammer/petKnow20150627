//
//  T_m_Tools.m
//  Chat2-14
//
//  Created by kiddopal on 15/5/8.
//  Copyright (c) 2015年 kiddopal. All rights reserved.
//

#import "T_m_Tools.h"

@implementation T_m_Tools


#pragma mark - 常用方法
//--------------------------------------------------
+(void)setImageToDest:(BOOL)yes1 AndThumbnail:(BOOL)yes2 AndURL:(NSString *)url AndDefaultImage:(NSString *)imageName AndBlock:(void (^)(UIImage *))animations{
    if (url.length > 0) {
        NSArray *array = [url componentsSeparatedByString:@"/"];
        
        UIImage *returnImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:[array lastObject]];
        if (!returnImage) {
            returnImage = [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:[array lastObject]];
        }
        
        if (returnImage) {
            animations(returnImage);
        }else{
            [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:url]
                                                                  options:SDWebImageDownloaderLowPriority
                                                                 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                                                 } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                                                                     [[SDImageCache sharedImageCache] storeImage:image forKey:[array lastObject] toDisk:yes1];
                                                                     
                                                                     animations(image);
                                                                     
                                                                 }];
            
        }
    }else{
        animations([UIImage imageNamed:imageName]);
    }
}

+(NSString *)getTimeWithFormat:(NSString *)format{
    NSDate *now = [NSDate date];
    NSDateFormatter  *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:format];
    NSString *nowYear = [dateformatter stringFromDate:now];
    
    return  nowYear;
}

+ (NSString *)md5HexDigest:(NSString*)input
{
    const char *cStr = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}
@end
