//
//  UIView+FadeRemind.h
//  Demos
//
//  Created by quanhai on 2017/4/21.
//  Copyright © 2017年 Quanhai. All rights reserved.
//

#import <UIKit/UIKit.h>

// reminder 会出现在view的内部, 用作提示使用
typedef NS_OPTIONS(NSInteger, ReminderShowType) {
    
    ReminderShowTypeBorderFade     = 1 <<0 ,   // 渐现 渐隐
//    ReminderShowTypeEasyInOut      = 1 <<1,    // 边缘滑出
    // 上面和下面混用 ， 请使用 与运算 ' | '
    ReminderShowTypeCenter         = 1 <<2,
    ReminderShowTypeTop            = 1 <<3,
    ReminderShowTypeBottom         = 1 <<4,
    ReminderShowTypeDefine         = 1 <<5
};

// poper 样式的reminder ， reminder会出现在view的外面， 这是靠在view的哪个方向
typedef NS_ENUM(NSInteger, ReminderStyle) {

    ReminderStylePoperTop          = 0,
    ReminderStylePoperLeft,
    ReminderStylePoperBottom,
    ReminderStylePoperRight
};

struct ReminderPoperMargin {
    CGFloat startMargin;   //  距离 self 的距离
    CGFloat endMargin;     //  距离 屏幕边缘 距离
};

typedef struct ReminderPoperMargin ReminderPoperMargin;
static const CGFloat reminderDismissDuration = 1.5f;
static const CGFloat reminderShowDuration = 0.8f;
static const CGFloat reminderHoldDuration = 1.5f;

/*
 *  常用的颜色
 */
#define  RGBA(r ,g , b, a) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]

#define ReminderYellowColor  RGBA(240, 230, 140, 1)
#define ReminderRedColor     RGBA(255, 99, 71, 1)
#define ReminderBlueColor    RGBA(230, 230, 250, 1)
#define ReminderPurpleColor  RGBA(186, 85, 211, 1)
#define ReminderSliverColor  RGBA(192, 192, 192, 1)

/**
    在view 上 添加 提示文字 框, view.clipToBounds must be No, or , view.layer.maskToBounds must be No;
 */
@interface UIView (FadeRemind)

@property (nonatomic, strong)  UIColor * _Nullable fadeTextColor; /**<字体颜色， default white*/
@property (nonatomic, strong) __kindof UIFont * _Nullable fadeTextFont;/**<default systemFont 16.f*/
@property (nonatomic, assign) NSTextAlignment fadeTextAlignment; /**<default left*/
@property (nonatomic, strong) NSDictionary * _Nullable fadeTextAttributes; /**<default is nil*/

@property (nonatomic, assign) BOOL autoDismiss ;/**<自动消失, 默认时间为 1.5f, NO的时候点击后才会消失*/
@property (nonatomic, strong) UIColor * _Nullable reminderColor; /**<底色*/
//@property (nonatomic, strong) NSArray<UIColor *> *reminderColors; /**<渐变色*/
@property (nonatomic, assign) CGFloat reminderCornerRedius ;/**< default 0.f*/

@property (nonatomic, copy, readonly) NSString * _Nullable fadeText;
@property (nonatomic, strong, readonly) NSArray * _Nullable reminders; /**<<##>*/


// @interface UIView(RectReminder)
@property (nonatomic ,assign) ReminderShowType showType; /**<显现方式 default: fade|center */
@property (nonatomic, assign) CGFloat reminderMinY ;/**<ReminderShowTypeDefine 可用*/
@property (nonatomic, assign) CGFloat reminderOffset ;/**<距边缘距离, 默认为0.f , inner 为正*/

/**
 显示 提示框 methods
 默认样式： reminderCornerRedius = 0.f; fadeTextFont = uifont.16 ; fadeTextAlignment = left ;
 autoDismiss = No;   reminderColor = red ;showType = fade|center
 
 @param text 提示语
 @param reminderIndentifer 提示框的唯一identifer， 可以添加多个提示框
 */
// 普通reminder， 默认方形，显示在中心，侧边距为16, 最好在viewcontroller.view 中使用
- (void)showDefaultReminderWithText:(NSString * _Nullable)text reminderKey:( NSString * _Nonnull )reminderIndentifer;

- (void)showReminderWithText:(NSString * _Nullable)text reminderKey:(NSString * _Nonnull)reminderIndentifer;


//@interface UIView(PoperReminder)
@property (nonatomic, assign) ReminderStyle reminderStyle ;/**<样式*/
@property (nonatomic, assign) ReminderPoperMargin poperMargin ;/**<<##>*/

// poper 样式,带尖角的那种， 请设置 poperMargin , 默认为 0,0

/**
 <#Description#>
 
 @param text <#text description#>
 @param reminderIndentifer <#reminderIndentifer description#>
 */
- (void)showReminderPoperWithText:(NSString * _Nullable)text reminderKey:(NSString * _Nonnull)reminderIndentifer;



#pragma mark - methods
/**
 删除掉某个提示框

 @param reminderIdentifer 唯一identifer
 */
- (void)dismissReminderWithKey:(NSString * _Nonnull)reminderIdentifer;


/**
 清除所有提示框体
 */
- (void)clearReminders;


@end

