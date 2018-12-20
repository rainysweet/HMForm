//
//  NSObject+bundle.m
//  YLinkFormFrameWork
//
//  Created by Sven on 2018/12/14.
//  Copyright © 2018年 Sven. All rights reserved.
//

#import "NSObject+bundle.h"

@implementation NSObject (bundle)

+ (NSString *)backYlinkBundleSorceStringWithFileName:(NSString *)fileName
{
    
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    
    NSString *bundlePath = [resourcePath stringByAppendingPathComponent:@"Ylink.bundle"];
    
    NSString *filePath = [bundlePath stringByAppendingPathComponent:fileName];
    
    return filePath;
}

@end
