//
//  YlinkNativeRingChart.m
//  YLinkFormFrameWork
//
//  Created by Sven on 2018/12/13.
//  Copyright © 2018年 Sven. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,MarkViewDirection){
    MarkViewDirectionNone = 0,
    MarkViewDirectionTop,
    MarkViewDirectionBottom,
    MarkViewDirectionLeft,
    MarkViewDirectionRight
};

@interface YlinkNativeRingChart : UIView

/**
 初始化方法

 @param frame 图表frame
 @param markViewDirection 标注View在图表的方向 默认不显示标注View
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame markViewDirection:(MarkViewDirection)markViewDirection;
///中心文字
@property (nonatomic, copy) NSString *title;
@property (nonatomic, weak) UIColor *titleColor;
@property (nonatomic, weak) UIFont *titleFont;
///标注值
@property (nonatomic, weak) UIColor *valueColor;
@property (nonatomic, weak) UIFont *valueFont;
///颜色数组
@property (nonatomic, strong) NSArray *colorArray;
///值数组
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *valueArray;
///图表宽
@property (nonatomic, assign) CGFloat ringWidth;
///绘图
- (void)drawArc;
@end
