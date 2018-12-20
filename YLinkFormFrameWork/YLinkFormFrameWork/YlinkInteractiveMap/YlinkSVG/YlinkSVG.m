//
//  YlinkSVG
//  YLinkFormFrameWork
//
//  Created by Sven on 2018/12/14.
//  Copyright © 2018年 Sven. All rights reserved.
//

#import "YlinkSVG.h"
#import "NSObject+bundle.h"

@interface YlinkSVG()
@property (nonatomic, strong) NSMutableArray* transforms;
@property (nonatomic) CGAffineTransform currentTransform;
@end

@implementation YlinkSVG

+ (instancetype)svgWithFile:(NSString*)filePath
{
    return [[YlinkSVG alloc] initWithFile:filePath];
}

- (id)initWithFile:(NSString*)filename
{
    self = [super init];
    
    if(self) {
        _paths = [NSMutableArray array];
        _transforms = [NSMutableArray array];
        _currentTransform = CGAffineTransformIdentity;
        
        
        NSData *data = [NSData dataWithContentsOfFile:[NSBundle backYlinkBundleSorceStringWithFileName:filename]];
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
        parser.delegate = self;
        [parser parse];
        [self computeBounds];
    }
    
    return self;
}



#pragma mark - Xml Parsing

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if([elementName isEqualToString:@"path"])
    {
        YlinkVGPathElement* element = [[YlinkVGPathElement alloc] initWithAttributes:attributeDict];
        if(element.path) {
            [_paths addObject:element];
        }
        
        CGAffineTransform t = _currentTransform;
        
        if([attributeDict objectForKey:@"transform"]) {
            CGAffineTransform pathTransform = [YinkSVGUtils parseTransform:[attributeDict objectForKey:@"transform"]];
            t = CGAffineTransformConcat(pathTransform, _currentTransform);
        }
        
        [element.path applyTransform:t];
    }
    else if([elementName isEqualToString:@"g"])
    {
        // Push
        CGAffineTransform t = CGAffineTransformIdentity;
        
        if([attributeDict objectForKey:@"transform"]) {
            t = [YinkSVGUtils parseTransform:[attributeDict objectForKey:@"transform"]];
        }
        
        _currentTransform = CGAffineTransformConcat(t, _currentTransform);
        [_transforms addObject:NSStringFromCGAffineTransform(_currentTransform)];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if([elementName isEqualToString:@"g"])
    {
        // Pop
        [_transforms removeLastObject];
        
        if([_transforms count] > 0 ) {
            _currentTransform = CGAffineTransformFromString([_transforms lastObject]);
        } else {
            _currentTransform = CGAffineTransformIdentity;
        }
    }
}

#pragma mark - Bounds

- (void)computeBounds
{
    _bounds.origin.x = MAXFLOAT;
    _bounds.origin.y = MAXFLOAT;
    float maxx = -MAXFLOAT;
    float maxy = -MAXFLOAT;
    
    for (YlinkVGPathElement* path in _paths) {
        CGRect b =  CGPathGetPathBoundingBox(path.path.CGPath);
        
        if(b.origin.x < _bounds.origin.x)
            _bounds.origin.x = b.origin.x;
        
        if(b.origin.y < _bounds.origin.y)
            _bounds.origin.y = b.origin.y;
        
        if(b.origin.x + b.size.width > maxx)
            maxx = b.origin.x + b.size.width;
        
        if(b.origin.y + b.size.height > maxy)
            maxy = b.origin.y + b.size.height;
    }
    
    _bounds.size.width = maxx - _bounds.origin.x;
    _bounds.size.height = maxy - _bounds.origin.y;
}

@end
