//
//  ReminderAngle.h
//  Demos
//
//  Created by quanhai on 2017/5/22.
//  Copyright © 2017年 Quanhai. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, AngleLocate) {
    AngleLocateTop,
    AngleLocateLeft,
    AngleLocateBottom,
    AngleLocateRight
};


static const CGFloat squreLength  = 10.f;


@interface ReminderAngle : UIView


- (instancetype)initWithLocate:(AngleLocate)locate angleColor:(UIColor *)color NS_DESIGNATED_INITIALIZER;

@end
