//
//  YinkSVGUtils
//  YLinkFormFrameWork
//
//  Created by Sven on 2018/12/14.
//  Copyright © 2018年 Sven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YinkSVGUtils : NSObject

+ (NSArray*)parsePoints:(const char *)str;
+ (CGAffineTransform)parseTransform:(NSString*)str;

@end
