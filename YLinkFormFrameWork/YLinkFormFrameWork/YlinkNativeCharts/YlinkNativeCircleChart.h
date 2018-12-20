//
//  YlinkNativeBarChart.m
//  YLinkFormFrameWork
//
//  Created by Sven on 2018/12/13.
//  Copyright © 2018年 Sven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YlinkNativeCircleChart : UIView

///初始化方法
- (instancetype)initWithFrame:(CGRect)frame withMaxValue:(CGFloat)maxValue value:(CGFloat)value;
///值相关
@property (nonatomic, copy) NSString *valueTitle;
@property (nonatomic, weak) UIColor *valueColor;
@property (nonatomic, weak) UIFont *valueFont;
///渐变色数组
@property (nonatomic, strong) NSArray *colorArray;
///渐变色数组所占位置
@property (nonatomic, strong) NSArray *locations;
///底圆颜色
@property (nonatomic, strong) UIColor *insideCircleColor;
///单色
@property (nonatomic, strong) UIColor *singleColor;
@end
