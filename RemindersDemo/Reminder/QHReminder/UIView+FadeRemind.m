//
//  UIView+FadeRemind.m
//  Demos
//
//  Created by quanhai on 2017/4/21.
//  Copyright © 2017年 Quanhai. All rights reserved.
//

#import "UIView+FadeRemind.h"
#import <objc/runtime.h>
#import <Masonry.h>
#import "ReminderAngle.h"

static CGFloat baseTag = 111;
static const NSString *kBaseIdentifer = @"reminderBaseIdentifer";


@implementation UIView (FadeRemind)
@dynamic reminderStyle;
@dynamic showType;
@dynamic fadeText;
@dynamic fadeTextColor;
@dynamic fadeTextFont;
@dynamic fadeTextAttributes;
@dynamic fadeTextAlignment;
@dynamic reminderColor;
//@dynamic reminderColors;
@dynamic reminderCornerRedius;
@dynamic autoDismiss;
@dynamic reminderOffset;
@dynamic reminderMinY;
@dynamic poperMargin;
@dynamic reminders;


/**
 <#Description#>

 @return <#return value description#>
 */
- (ReminderStyle)reminderStyle
{
    return [objc_getAssociatedObject(self, @selector(reminderStyle)) integerValue];
}
- (void)setReminderStyle:(ReminderStyle)reminderStyle
{
    objc_setAssociatedObject(self, @selector(reminderStyle), @(reminderStyle), OBJC_ASSOCIATION_ASSIGN);
}

/**
 <#Description#>

 @return <#return value description#>
 */
- (ReminderShowType)showType
{
    return [objc_getAssociatedObject(self, @selector(showType)) integerValue];
}
- (void)setShowType:(ReminderShowType)showType
{
    objc_setAssociatedObject(self, @selector(showType), @(showType), OBJC_ASSOCIATION_ASSIGN);
}


/**
 <#Description#>

 @return <#return value description#>
 */
- (NSString *)fadeText
{
    return objc_getAssociatedObject(self, @selector(fadeText));
}
- (void)setFadeText:(NSString *)fadeText
{
    objc_setAssociatedObject(self, @selector(fadeText), fadeText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 <#Description#>

 @return <#return value description#>
 */
- (UIColor *)fadeTextColor
{
    id color = objc_getAssociatedObject(self, @selector(fadeTextColor));
    if(color == nil) color = [UIColor whiteColor];
    
    return color;
}
- (void)setFadeTextColor:(UIColor *)fadeTextColor
{
    objc_setAssociatedObject(self, @selector(fadeTextColor), fadeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 <#Description#>

 @return <#return value description#>
 */
- (UIFont *)fadeTextFont
{
    id font = objc_getAssociatedObject(self, @selector(fadeTextFont));
    if (!font) {
        font = [UIFont systemFontOfSize:16];
    }
    
    return font;
}

- (void)setFadeTextFont:(__kindof UIFont *)fadeTextFont
{
    objc_setAssociatedObject(self, @selector(fadeTextFont), fadeTextFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 <#Description#>

 @return <#return value description#>
 */
- (NSDictionary *)fadeTextAttributes
{
    return objc_getAssociatedObject(self, @selector(fadeTextAttributes));
}
- (void)setFadeTextAttributes:(NSDictionary *)fadeTextAttributes
{
    objc_setAssociatedObject(self, @selector(fadeTextAttributes), fadeTextAttributes, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 <#Description#>

 @return <#return value description#>
 */
- (NSTextAlignment)fadeTextAlignment
{
    return [objc_getAssociatedObject(self, @selector(fadeTextAlignment)) integerValue];
}
- (void)setFadeTextAlignment:(NSTextAlignment)fadeTextAlignment
{
    objc_setAssociatedObject(self, @selector(fadeTextAlignment), @(fadeTextAlignment), OBJC_ASSOCIATION_ASSIGN);
}

/**
 <#Description#>

 @return <#return value description#>
 */
- (UIColor *)reminderColor
{
    id color = objc_getAssociatedObject(self, @selector(reminderColor));
    if (!color) {
        color = ReminderRedColor;
    }
    return color;
}
- (void)setReminderColor:(UIColor *)reminderColor
{
    objc_setAssociatedObject(self, @selector(reminderColor), reminderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 <#Description#>

 @return <#return value description#>
 */
- (NSArray<UIColor *> *)reminderColors
{
    id color = objc_getAssociatedObject(self, @selector(reminderColors));
    if (!color) {
        color = @[[UIColor purpleColor], [UIColor redColor]];
    }
    return color;
}
- (void)setReminderColors:(NSArray<UIColor *> *)reminderColors
{
    objc_setAssociatedObject(self, @selector(reminderColors), reminderColors, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 <#Description#>

 @return <#return value description#>
 */
- (CGFloat)reminderCornerRedius
{
    return [objc_getAssociatedObject(self, @selector(reminderCornerRedius)) floatValue];
}
- (void)setReminderCornerRedius:(CGFloat)reminderCornerRedius
{
    objc_setAssociatedObject(self, @selector(reminderCornerRedius), @(reminderCornerRedius), OBJC_ASSOCIATION_ASSIGN);
}

/**
 <#Description#>

 @return <#return value description#>
 */
- (BOOL)autoDismiss
{
    return [objc_getAssociatedObject(self, @selector(autoDismiss)) boolValue];
}
- (void)setAutoDismiss:(BOOL)autoDismiss
{
    objc_setAssociatedObject(self, @selector(autoDismiss), @(autoDismiss), OBJC_ASSOCIATION_ASSIGN);
}

-(CGFloat)reminderOffset
{
    return [objc_getAssociatedObject(self, @selector(reminderOffset)) floatValue];
}
- (void)setReminderOffset:(CGFloat)reminderOffset
{
    objc_setAssociatedObject(self, @selector(reminderOffset), @(reminderOffset), OBJC_ASSOCIATION_ASSIGN);
}

-(CGFloat)reminderMinY
{
    id value = objc_getAssociatedObject(self, @selector(reminderMinY));
    return [value floatValue];
}
- (void)setReminderMinY:(CGFloat)reminderMinY
{
    objc_setAssociatedObject(self, @selector(reminderMinY), @(reminderMinY), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (ReminderPoperMargin)poperMargin
{
    ReminderPoperMargin poperMargin ;
    poperMargin.startMargin = [self poperStartMargin];
    poperMargin.endMargin = [self poperEndMargin];
    
    return poperMargin;
}
- (void)setPoperMargin:(ReminderPoperMargin)poperMargin
{
    [self setPoperStartMargin:poperMargin.startMargin];
    [self setPoperEndMargin:poperMargin.endMargin];
}


- (CGFloat)poperStartMargin
{
    return [objc_getAssociatedObject(self, @selector(poperStartMargin)) floatValue];
}
- (void)setPoperStartMargin:(CGFloat)poperStartMargin
{
    objc_setAssociatedObject(self, @selector(poperStartMargin), @(poperStartMargin), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)poperEndMargin
{
    return [objc_getAssociatedObject(self, @selector(poperEndMargin)) floatValue];
}
- (void)setPoperEndMargin:(CGFloat)poperEndMargin
{
    objc_setAssociatedObject(self, @selector(poperEndMargin), @(poperEndMargin), OBJC_ASSOCIATION_ASSIGN);
}

- (NSArray *)reminders
{
    NSDictionary *reminderInfo = [self reminderInfos];
    return reminderInfo.allKeys;
}


- (NSDictionary *)reminderInfos
{
    return objc_getAssociatedObject(self, @selector(reminderInfos));
}
- (void)setReminderInfos:(NSDictionary *)reminderInfos
{
    objc_setAssociatedObject(self, @selector(reminderInfos), reminderInfos, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - methods
- (BOOL)saveReminderIndentifer:(NSString *)identifer
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[self reminderInfos]];
    
    if(dic.count == 0)
       [dic setObject:@(0) forKey:kBaseIdentifer];
    
    if ([dic.allKeys containsObject:identifer]) {
        NSLog(@"已经有此identifer 了：\"%@\", 请勿重复使用",identifer);
        return NO;
    }
    
    // 使用过的identifer 个数， 即使删除了依然计数， 用于保证tag 的唯一性
    NSInteger reminderCount = [dic[kBaseIdentifer] integerValue] + 1;
    [dic setObject:@(reminderCount) forKey:kBaseIdentifer];
    
    [dic setObject:@(reminderCount +baseTag) forKey:identifer];
    
     [self setReminderInfos:dic];
    
    return YES;
}



- (void)showDefaultReminderWithText:(NSString *)text reminderKey:(NSString *)reminderIndentifer
{
    self.showType = ReminderShowTypeCenter | ReminderShowTypeBorderFade;
    self.reminderOffset = 16.f;
    
    [self showReminderWithText:text reminderKey:reminderIndentifer];
}

- (void)showReminderWithText:(NSString *)text reminderKey:(NSString *)reminderIndentifer
{
    self.fadeText = text;
//    self.reminderStyle = ReminderStyleCustom;

   if( ![self saveReminderIndentifer:reminderIndentifer])
       return ;
    
    [self setupSubviewsWithIdentifer:reminderIndentifer];
}


- (void)setupSubviewsWithIdentifer:(NSString *)identifer
{
    NSDictionary *attributes = self.fadeTextAttributes;
    if (!attributes) {
        NSMutableParagraphStyle *paraph = [[NSMutableParagraphStyle alloc] init];
        paraph.alignment = self.fadeTextAlignment;
        paraph.lineSpacing = 5.f;
        
        attributes = @{
                       NSFontAttributeName : self.fadeTextFont,
                       NSParagraphStyleAttributeName : paraph
                       };
    }
    
    UILabel *textLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.textColor = self.fadeTextColor;
        label.attributedText = [[NSAttributedString alloc] initWithString:self.fadeText attributes:attributes];
        label;
    });

    UIView *view = [[UIView alloc] init];
    view.backgroundColor = self.reminderColor;
    view.layer.cornerRadius = self.reminderCornerRedius;
    view.layer.masksToBounds = YES;
    view.tag = [[[self reminderInfos] valueForKey:identifer] integerValue];
    
    [view addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(8);
        make.right.bottom.mas_equalTo(-8);
    }];
    
//    if (self.showType& ReminderShowTypeBorderFade)
        //
        NSLog(@"fade border type");
    [self addSubview:view];

    if(self.showType & ReminderShowTypeTop )
    {
        //
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.reminderOffset);
            make.right.mas_equalTo(-self.reminderOffset);
            make.top.mas_equalTo(15);
        }];
    }
    if(self.showType & ReminderShowTypeCenter)
    {
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.reminderOffset);
            make.right.mas_equalTo(-self.reminderOffset);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
    }
    if (self.showType & ReminderShowTypeBottom) {
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.reminderOffset);
            make.right.mas_equalTo(-self.reminderOffset);
            make.bottom.mas_equalTo(-15);
        }];
    }
    if(self.showType & ReminderShowTypeDefine){
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.reminderOffset);
            make.right.mas_equalTo(-self.reminderOffset);
            make.top.mas_equalTo(self.reminderMinY);
        }];
    }
    
    view.alpha = 0;
    [UIView animateWithDuration:reminderShowDuration animations:^{
        view.alpha = 1;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(reminderHoldDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self autoDismissReminder:identifer];
        });
    }];
}


- (void)showReminderPoperWithText:(NSString *)text reminderKey:(NSString *)reminderIndentifer
{
    self.fadeText = text;
    
    if( ![self saveReminderIndentifer:reminderIndentifer])
        return ;
    
    
    NSDictionary *attributes = self.fadeTextAttributes;
    if (!attributes) {
        NSMutableParagraphStyle *paraph = [[NSMutableParagraphStyle alloc] init];
        paraph.alignment = self.fadeTextAlignment;
        paraph.lineSpacing = 5.f;
        
        attributes = @{
                       NSFontAttributeName : self.fadeTextFont,
                       NSParagraphStyleAttributeName : paraph
                       };
    }
    
    UILabel *textLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.textColor = self.fadeTextColor;
        label.attributedText = [[NSAttributedString alloc] initWithString:self.fadeText attributes:attributes];
        label;
    });
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = self.reminderColor;
    view.layer.cornerRadius = self.reminderCornerRedius;
//    view.layer.masksToBounds = YES;
    view.tag = [[[self reminderInfos] valueForKey:reminderIndentifer] integerValue];
    
    
    [self addSubview:view];
    [view addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(8);
        make.right.bottom.mas_equalTo(-8);
    }];

    
    switch (self.reminderStyle) {
        case ReminderStylePoperTop:
        {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.greaterThanOrEqualTo(self.superview.mas_top).offset(self.poperMargin.endMargin);
                make.bottom.mas_equalTo(self.mas_top).offset(- self.poperMargin.startMargin);
                make.centerX.mas_equalTo(self.mas_centerX);
            }];
            
            ReminderAngle *angle = [[ReminderAngle alloc] initWithLocate:AngleLocateTop angleColor:self.reminderColor];
            [view addSubview:angle];
            [angle mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(view.mas_bottom);
                make.centerX.mas_equalTo(view.mas_centerX);
                make.width.height.mas_equalTo(squreLength);
            }];
        }
            break;
        
        case ReminderStylePoperLeft:
        {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.greaterThanOrEqualTo(self.superview.mas_left).offset(self.poperMargin.endMargin);
                make.right.mas_equalTo(self.mas_left).offset(- self.poperMargin.startMargin);
                make.centerY.mas_equalTo(self.mas_centerY);
            }];
            
            ReminderAngle *angle = [[ReminderAngle alloc] initWithLocate:AngleLocateLeft angleColor:self.reminderColor];
            [view addSubview:angle];
            [angle mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(view.mas_right);
                make.centerY.mas_equalTo(view.mas_centerY);
                make.width.height.mas_equalTo(squreLength);
            }];
        }
            break;
            
        case ReminderStylePoperBottom:
        {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.mas_bottom).offset(self.poperMargin.startMargin);
                make.bottom.lessThanOrEqualTo(self.superview.mas_bottom).offset(- self.poperMargin.endMargin);
                make.centerX.mas_equalTo(self.mas_centerX);
            }];
            
            ReminderAngle *angle = [[ReminderAngle alloc] initWithLocate:AngleLocateBottom angleColor:self.reminderColor];
            [view addSubview:angle];
            [angle mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(view.mas_top);
                make.centerX.mas_equalTo(view.mas_centerX);
                make.width.height.mas_equalTo(squreLength);
            }];
        }
            break;
            
       case ReminderStylePoperRight:
        {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.mas_right).offset(self.poperMargin.startMargin);
                make.right.lessThanOrEqualTo(self.superview.mas_right).offset(- self.poperMargin.endMargin);
                make.centerY.mas_equalTo(self.mas_centerY);
            }];
            
            ReminderAngle *angle = [[ReminderAngle alloc] initWithLocate:AngleLocateRight angleColor:self.reminderColor];
            [view addSubview:angle];
            [angle mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(view.mas_left);
                make.centerY.mas_equalTo(view.mas_centerY);
                make.width.height.mas_equalTo(squreLength);
            }];
        }
            break;
    }
    
    
    view.alpha = 0;
    [UIView animateWithDuration:reminderShowDuration animations:^{
        view.alpha = 1;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(reminderHoldDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self autoDismissReminder:reminderIndentifer];
        });
    }];
}




- (void)autoDismissReminder:(NSString *)reminderId
{
    if (self.autoDismiss){
        // 自动消失
        [self dismissReminderWithKey:reminderId];
    }
}


- (void)dismissReminderWithKey:(NSString *)reminderIdentifer
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[self reminderInfos]];
    if (![dic.allKeys containsObject:reminderIdentifer]) {
        NSLog(@"没有此identifer：\"%@\" ", reminderIdentifer);
        return;
    }
    
    NSInteger tag = [[[self reminderInfos] valueForKey:reminderIdentifer] integerValue];
    
    UIView *view = [self viewWithTag:tag];
    [UIView animateWithDuration:reminderDismissDuration animations:^{
        view.alpha = 0;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
    
    [dic removeObjectForKey:reminderIdentifer];
    [self setReminderInfos:dic];
}

- (void)clearReminders
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[self reminderInfos]];
    
    if(dic.allKeys.count <= 1) return;
    
    for (int i = 0; i < dic.allKeys.count; i ++) {
        
        NSString *reminderId = dic.allKeys[i];
        NSInteger tag = [[[self reminderInfos] valueForKey:reminderId] integerValue];
        UIView *view = [self viewWithTag:tag];
        [view removeFromSuperview];
    }
    NSDictionary *baseDic = @{kBaseIdentifer : @(0)};
    [self setReminderInfos:baseDic];
}



@end
