//
//  YLinkObejct.m
//  YLinkFormFrameWork
//
//  Created by Sven on 2018/12/13.
//  Copyright © 2018年 Sven. All rights reserved.
//

#import "YLinkObejct.h"

@implementation YLinkObejct

/**
 单例初始化

 @return self object
 */
+ (YLinkObejct *)shareInstance
{
    static dispatch_once_t onceToken;
    static YLinkObejct * instance;
    dispatch_once(&onceToken,^{
        instance = [[YLinkObejct alloc]init];
    });
    return instance;
}

+ (YlinkNativeBarChart *)getANativeBarChartWith:(CGRect)frame andTitleArr:(NSArray *)titleArr andValueArr:(NSArray *)valueArr andColorArr:(NSArray *)colorArr andDirection:(OrientationType)direction{
    
    ///渐变色
    YlinkNativeBarChart *bar = [[YlinkNativeBarChart alloc] initWithFrame:frame withMarkLabelCount:(int)titleArr.count withOrientationType:direction];
    
    bar.titleArray = titleArr;
    
    bar.valueArray = valueArr;
    
    bar.colorArray = colorArr;
    
    bar.locations = @[@0.15,@.85];
    
    bar.backgroundLineColor = [self colorWithHexString:@"#4b4e52" alpha:1];
    
    return bar;
}


+ (YlinkNativeLineChart *)getANativeLineChartWith:(CGRect)frame
                                      andTitleArr:(NSArray *)titleArr
                                      andValueArr:(NSArray *)valueArr
                                     andLineColor:(UIColor *)lineColor
                                    andDFillColor:(UIColor *)fillColor
{
    YlinkNativeLineChart *line = [[YlinkNativeLineChart alloc] initWithFrame:frame];
    
    [line setTitleArray:titleArr];
    
    [line setValue:valueArr withYLineCount:valueArr.count];
    
    line.lineColor = lineColor;
    
    line.fillColor = fillColor;
    
    line.backgroundLineColor = [self colorWithHexString:@"#4b4e52" alpha:1];
    
    return line;
}


+ (YlinkNativeGaugeChart *)getANativeGaugeChartChartWith:(CGRect)frame
                                           andTitleValue:(NSString *)title
                                             andNowValue:(CGFloat)nowValue
                                             andMaxValue:(CGFloat )maxValue
                                            andMarkCount:(int)markCount
{
    YlinkNativeGaugeChart *gauge = [[YlinkNativeGaugeChart alloc] initWithFrame:frame withMaxValue:maxValue value:nowValue];
    
    gauge.valueTitle = title;
    gauge.colorArray = @[[self colorWithHexString:@"#33d24e" alpha:1],
                         [self colorWithHexString:@"#f8e71c" alpha:1],
                         [self colorWithHexString:@"#ff9500" alpha:1],
                         [self colorWithHexString:@"#ff4e65" alpha:1]];
    gauge.locations = @[@0.15,@0.4,@0.65,@0.8];
    
    gauge.markLabelCount = markCount;
    
    return gauge;
}


+ (YlinkNativeCircleChart *)getANativeCircleChartChartWith:(CGRect)frame
                                             andTitleValue:(NSString *)title
                                               andNowValue:(CGFloat)nowValue
                                               andMaxValue:(CGFloat )maxValue
                                               andColorArr:(NSArray *)colorArr
{

    YlinkNativeCircleChart *circle = [[YlinkNativeCircleChart alloc] initWithFrame:frame withMaxValue:maxValue value:nowValue];
    
    circle.valueTitle = title;
    
    circle.colorArray = colorArr;
    
    circle.locations = @[@0.15,@0.85];
    
    return circle;
    
}


+ (YlinkNativeRingChart *)getANativeRingChartWith:(CGRect)frame
                                      andTitleArr:(NSArray *)titleArr
                                      andValueArr:(NSArray *)valueArr
                                      andColorArr:(NSArray *)colorArr
                                     andDirection:(MarkViewDirection)direction
{
    YlinkNativeRingChart *ring = [[YlinkNativeRingChart alloc] initWithFrame:frame markViewDirection:direction];
    ring.colorArray = colorArr;
    ring.valueArray = valueArr;
    ring.titleArray = titleArr;
    ring.ringWidth = 20.0;
    ring.title = @"总计";
    [ring drawArc];
    
    return ring;
}

+ (YlinkInteractiveMapView *)getAInteractiveMapViewWith:(CGRect)frame
                                                 andDic:(NSMutableDictionary *)dic
                                            andColorArr:(NSArray *)colorArr
                                        andClickHandler:(void(^)(NSString* identifier, CAShapeLayer* layer))ClickHander
{
    
    
    YlinkInteractiveMapView* map = [[YlinkInteractiveMapView alloc] initWithFrame:frame];
    
    [map loadMap:@"china-low.svg" withData:dic colorAxis:colorArr];
    
    [map setClickHandler:^(NSString* identifier, CAShapeLayer* layer) {
        
//        // 增加阴影效果
//        if(_oldClickedLayer) {
//            _oldClickedLayer.zPosition = 0;
//            _oldClickedLayer.shadowOpacity = 0;
//        }
//
//        _oldClickedLayer = layer;
//
//        // We set a simple effect on the layer clicked to highlight it
//        layer.zPosition = 10;
//        layer.shadowOpacity = 0.5;
//        layer.shadowColor = [UIColor blackColor].CGColor;
//        layer.shadowRadius = 5;
//        layer.shadowOffset = CGSizeMake(0, 0);
        
        ClickHander(identifier,layer);
    }];
    
    return map;
}



#pragma mark 设置16进制颜色
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

+ (AAChartView *)getAAChartViewWith:(AAChartModel *)AAChartModel
                           andFrame:(CGRect)frame
                andIsClearBackColor:(BOOL)isClear
                  andIsEnableScroll:(BOOL)isScroll
{
    AAChartView * chartV = [[AAChartView alloc]initWithFrame:frame];
    chartV.isClearBackgroundColor = isClear;
    chartV.scrollEnabled = isScroll;
    
    [chartV aa_drawChartWithChartModel:AAChartModel];
    return chartV;
}

+ (AAChartModel *)getAChartModelWith:(NSString *)chartType
                            andTitle:(NSString *)title
                         andSubTitle:(NSString *)subTitle
                         andStacking:(NSString *)stacking
                       andColorTheme:(NSArray<NSString *> *)colorThemes
                           andSeries:(NSArray<AASeriesElement *> *)Series
{
     AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(chartType)
    .titleSet(title)
    .subtitleSet(subTitle)
    .stackingSet(stacking)
    .colorsThemeSet(colorThemes)//主题颜色数组
    .seriesSet(Series);
    
    return aaChartModel;
}

+ (AASeriesElement *)getASeriedElementWithName:(NSString*)name
                                       dataArr:(NSArray *)dataArr
                                  andDataLabel:(AADataLabels *)dataLabel
{
    AASeriesElement * element = AASeriesElement.new
    .nameSet(@"新用户")
    .dataSet(dataArr)
    .dataLabelsSet(dataLabel);
    return element;
}

@end
