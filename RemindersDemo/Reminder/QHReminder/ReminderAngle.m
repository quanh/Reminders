//
//  ReminderAngle.m
//  Demos
//
//  Created by quanhai on 2017/5/22.
//  Copyright © 2017年 Quanhai. All rights reserved.
//

#import "ReminderAngle.h"



@interface ReminderAngle()

@property (nonatomic, assign) AngleLocate located;
@property (nonatomic, strong) UIColor *angleColor;

@end

@implementation ReminderAngle

+ (Class)layerClass
{
    return [CAShapeLayer class];
}


- (instancetype)initWithLocate:(AngleLocate)locate angleColor:(UIColor *)color
{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, squreLength, squreLength);
        self.located = locate;
        self.angleColor = color;
        
        [self drawAngle];
    }
    return self;
}


- (void)drawAngle
{
    CGPoint point_0 = CGPointMake(0, 0);
    CGPoint point_1 = CGPointMake(squreLength/2, squreLength);
    CGPoint point_2 = CGPointMake(squreLength, 0);
    
    UIBezierPath *anglePath = [UIBezierPath bezierPath];
    
    switch (self.located) {
        case AngleLocateTop:
            
            break;
            
       case AngleLocateLeft:
            point_1 = CGPointMake(squreLength, squreLength/2);
            point_2 = CGPointMake(0, squreLength);
            break;
            
        case AngleLocateRight:
            point_0 = CGPointMake(squreLength, 0);
            point_1 = CGPointMake(0, squreLength/2);
            point_2 = CGPointMake(squreLength, squreLength);
            break;
            
        case AngleLocateBottom:
            point_0 = CGPointMake(0, squreLength);
            point_1 = CGPointMake(squreLength/2, 0);
            point_2 = CGPointMake(squreLength, squreLength);
            break;
    }
    
    [anglePath moveToPoint:point_0];
    [anglePath addLineToPoint:point_1];
    [anglePath addLineToPoint:point_2];
    [anglePath closePath];
    
    CAShapeLayer *layer = (CAShapeLayer *)self.layer;
    layer.path = anglePath.CGPath;
    layer.fillColor = self.angleColor.CGColor;
}




@end
