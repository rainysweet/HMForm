//
//  YlinkNativeLineChart.m
//  YLinkFormFrameWork
//
//  Created by Sven on 2018/12/13.
//  Copyright © 2018年 Sven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YlinkNativeLineChart : UIView


/**
 赋值value

 @param valueArray valueArray
 @param count Y轴标注值的个数
 */
- (void)setValue:(NSArray *)valueArray withYLineCount:(int)count;
///x轴文字
@property (nonatomic, strong) NSArray *titleArray;
///标注
@property (nonatomic, weak) UIColor *markTextColor;
@property (nonatomic, weak) UIFont *markTextFont;
///线颜色
@property (nonatomic, weak) UIColor *lineColor;
///填充颜色
@property (nonatomic, weak) UIColor *fillColor;
///背景线颜色
@property (nonatomic, weak) UIColor *backgroundLineColor;
@end
