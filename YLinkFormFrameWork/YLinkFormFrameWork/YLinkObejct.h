//
//  YLinkObejct.h
//  YLinkFormFrameWork
//
//  Created by Sven on 2018/12/13.
//  Copyright © 2018年 Sven. All rights reserved.
//
// 暴露出来的主类，集成 原生 js 展示表格方法 具体调用方法，参考下方每个方法的注释.有些设置成了默认参数，如果想要设置一些别的值 建议看看是否在该类的原文件中有该属性，如果有，可以直接利用返回的表 设置该值。

#import <Foundation/Foundation.h>
#import "YlinkNativeCharts.h"
#import "YlinkInteractiveMapView.h"
#import "AAChartKit.h"
#import "AAChartView.h"

@interface YLinkObejct : NSObject

/**
 单例初始化实例对象

 @return Objc
 */
+ (YLinkObejct *)shareInstance;

//=================================================================
//            几张native图表基本用法，详细用法请参照具体的图表文件
//=================================================================
#pragma mark - 几张native图表基本用法

/**
 生成一个默认颜色的柱状图    警告，记得titleArr valueArr colorArr 三者数据数量必须一致.否则可能引起崩溃

 @param frame frame
 @param titleArr 柱状图类型数组
 @param valueArr 每个类型对应的值数组
 @param direction 横向or纵向柱状图
 @param colorArr 柱状图颜色数组，按顺序
 @return barChart
 */
+ (YlinkNativeBarChart *)getANativeBarChartWith:(CGRect)frame
                                    andTitleArr:(NSArray *)titleArr
                                    andValueArr:(NSArray *)valueArr
                                    andColorArr:(NSArray *)colorArr
                                   andDirection:(OrientationType)direction;



/**
 生成一个折线图

 @param frame frame
 @param titleArr 纵轴数据数组
 @param valueArr 横轴数据数组
 @param lineColor 线的颜色
 @param fillColor 填充区域的颜色
 @return 折现填充图
 */
+ (YlinkNativeLineChart *)getANativeLineChartWith:(CGRect)frame
                                      andTitleArr:(NSArray *)titleArr
                                      andValueArr:(NSArray *)valueArr
                                     andLineColor:(UIColor *)lineColor
                                    andDFillColor:(UIColor *)fillColor;


/**
 返回一个仪表盘图

 @param frame frame
 @param title 中间显示的title文字
 @param nowValue 当前的仪表盘值
 @param maxValue 仪表盘最大值
 @param markCount 仪表盘所要分割成的最小单位
 @return 仪表图
 */
+ (YlinkNativeGaugeChart *)getANativeGaugeChartChartWith:(CGRect)frame
                                           andTitleValue:(NSString *)title
                                             andNowValue:(CGFloat)nowValue
                                             andMaxValue:(CGFloat )maxValue
                                            andMarkCount:(int)markCount;


/**
 返回一个单数据圆形图

 @param frame frame
 @param title 中间显示文字title
 @param nowValue 当前数值
 @param maxValue 最大数值
 @param colorArr 颜色数组，
 @return 圆形图
 */
+ (YlinkNativeCircleChart *)getANativeCircleChartChartWith:(CGRect)frame
                                            andTitleValue:(NSString *)title
                                              andNowValue:(CGFloat)nowValue
                                              andMaxValue:(CGFloat )maxValue
                                              andColorArr:(NSArray *)colorArr;


/**
 返回一个多数据环形图

 @param frame frame
 @param titleArr titleArr
 @param valueArr ValueArr
 @param colorArr colorArr
 @param direction markText Direction
 @return ring
 */
+ (YlinkNativeRingChart *)getANativeRingChartWith:(CGRect)frame
                                      andTitleArr:(NSArray *)titleArr
                                      andValueArr:(NSArray *)valueArr
                                      andColorArr:(NSArray *)colorArr
                                     andDirection:(MarkViewDirection)direction;



/**
 返回一个互动地图

 @param frame frame
 @param dic dic 数据
 @param colorArr 颜色数据
 @param ClickHander 点击区域相应事件回调
 @return YlinkInteractiveMapView
 */
+ (YlinkInteractiveMapView *)getAInteractiveMapViewWith:(CGRect)frame
                                      andDic:(NSMutableDictionary *)dic
                                      andColorArr:(NSArray *)colorArr
                                      andClickHandler:(void(^)(NSString* identifier, CAShapeLayer* layer))ClickHander;


//==============================================================================
//      下面主要封装一下AAChartView的使用,AAChartView使用Web容器展示，效果非常绚丽
//      缺点每个图标都是个webView 加载过多会有掉帧现象，考验硬件能力。
//==============================================================================
#pragma mark - 对AAChartView的二次封装

/**
 返回一个AAChartView

 @param AAChartModel AAChartModel
 @param frame frame
 @param isClear 是否背景为clear颜色
 @param isScroll 是否可以滑动 缩放 滚动
 @return AAChartView
 */
+ (AAChartView *)getAAChartViewWith:(AAChartModel *)AAChartModel
                           andFrame:(CGRect)frame
                andIsClearBackColor:(BOOL)isClear
                  andIsEnableScroll:(BOOL)isScroll;


/**
 返回一个chartModel

 @param chartType 表类型
 @param title title
 @param subTitle subTitle
 @param stacking 堆积类型
 @param colorThemes 颜色数组
 @param Series 数据series
 @return chartModel
 */
+ (AAChartModel *)getAChartModelWith:(NSString *)chartType
                            andTitle:(NSString *)title
                         andSubTitle:(NSString *)subTitle
                         andStacking:(NSString *)stacking
                       andColorTheme:(NSArray<NSString *> *)colorThemes
                           andSeries:(NSArray<AASeriesElement *> *)Series;



/**
 返回一个seriesElement

 @param name name
 @param dataArr 数据数组
 @param dataLabel 字符样式
 @return AASeriesElement
 */
+ (AASeriesElement *)getASeriedElementWithName:(NSString*)name
                                       dataArr:(NSArray *)dataArr
                                  andDataLabel:(AADataLabels *)dataLabel;

@end
