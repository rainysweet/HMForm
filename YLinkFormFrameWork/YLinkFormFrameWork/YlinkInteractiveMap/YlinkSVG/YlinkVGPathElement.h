//
//  YlinkVGPathElement
//  YLinkFormFrameWork
//
//  Created by Sven on 2018/12/14.
//  Copyright © 2018年 Sven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface YlinkVGPathElement : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* identifier;
@property (nonatomic, strong) NSString* className;
@property (nonatomic, strong) NSString* tranform;
@property (nonatomic, strong) UIBezierPath* path;
@property (nonatomic) BOOL fill;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
