//
//  MWPointView.m
//  涂鸦
//
//  Created by 16/1/25.
//  Copyright (c) 2016年. All rights reserved.
//

#import "MWPointView.h"

@interface MWPointView()

@property (nonatomic , strong)NSMutableArray *points;
@end

@implementation MWPointView
- (NSMutableArray *)points
{
    if (_points == nil) {
        _points = [NSMutableArray array];
    }
    return _points;
}

- (void)clear
{
    [self.points removeAllObjects];
    [self setNeedsDisplay];
}

- (void)back
{
    [self.points removeLastObject];
    [self setNeedsDisplay];
}

/**
 *  确定起点
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint startPos = [touch locationInView:touch.view];
    
    //添加路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    /**
     *  设置路径的起始点为圆点
     */
    path.lineCapStyle = kCGLineCapRound;
    
    /**
     *  设置路径的结束点为圆点
     */
    path.lineJoinStyle = kCGLineJoinRound;
    
    /**
     *  路径的起始点用 moveToPoint：
     */
    [path moveToPoint:startPos];
    [self.points addObject:path];
    
    [self setNeedsDisplay];
}
/**
 *  连线
 */
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentPos = [touch locationInView:touch.view];
    
   UIBezierPath *currentPath = self.points.lastObject;
    [currentPath addLineToPoint:currentPos];
    /**
     *  刷新帧
     */
    [self setNeedsDisplay];
}
/**
 *  连线
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
}

-(void)drawRect:(CGRect)rect
{
    for (UIBezierPath *path in self.points) {
        path.lineWidth = 3.0f;
        [path stroke];
    }
}

@end
