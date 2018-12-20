//
//  YlinkSVG
//  YLinkFormFrameWork
//
//  Created by Sven on 2018/12/14.
//  Copyright © 2018年 Sven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "YinkSVGUtils.h"
#import "YlinkVGPathElement.h"

@interface YlinkSVG : NSObject <NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableArray* paths;
@property (nonatomic) CGRect bounds;

+ (instancetype)svgWithFile:(NSString*)filePath;

@end
