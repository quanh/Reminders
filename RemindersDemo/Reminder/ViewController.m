//
//  ViewController.m
//  Reminder
//
//  Created by quanhai on 2017/5/22.
//  Copyright © 2017年 Quanhai. All rights reserved.
//

#import "ViewController.h"
#import "UIView+FadeRemind.h"


@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *toggleView;
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, assign) ReminderStyle style;

@end

@implementation ViewController

- (NSArray *)colors
{
    if (!_colors) {
        _colors = @[ReminderRedColor, ReminderBlueColor, ReminderPurpleColor, ReminderBlueColor];
    }
    return _colors;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view showDefaultReminderWithText:@"默认样式的reminder" reminderKey:@"defaultReminder"];
    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    [self.toggleView addGestureRecognizer:pan];
    _style = -1;
    self.toggleView.reminderCornerRedius = 10.f;
    self.toggleView.fadeTextFont = [UIFont boldSystemFontOfSize:15];
    ReminderPoperMargin margin;
    margin.startMargin = 20.f;
    margin.endMargin = 16.f;
    self.toggleView.poperMargin = margin;
}


- (IBAction)addRectReminder:(id)sender
{
    [self.view dismissReminderWithKey:@"defaultReminder"];
    self.view.showType = ReminderShowTypeBorderFade|ReminderShowTypeDefine;
    self.view.reminderMinY = self.view.bounds.size.height - 160;
    self.view.reminderOffset = 20.f;
    self.view.reminderColor = ReminderPurpleColor;
    self.view.reminderCornerRedius = 10.f;
    self.view.autoDismiss = YES;
    self.view.fadeTextAttributes = @{
                                     NSFontAttributeName:[UIFont boldSystemFontOfSize:20],
                                     NSForegroundColorAttributeName: [UIColor greenColor]
                                     };
    [self.view showReminderWithText:@"自定义位置的reminder， \n 横看成岭侧成峰 \n远近高低各不同" reminderKey:@"reminderDefineRect"];
}

- (IBAction)poperReminder:(id)sender
{
    if (_style == ReminderStylePoperRight) {
        [self.toggleView clearReminders];
        _style = -1;
        return;
    }else{
        _style ++;
    }
    self.toggleView.reminderStyle = _style;
    self.toggleView.reminderColor = self.colors[_style];
    NSString *keyId = [NSString stringWithFormat:@"%ld reminder", (long)_style];
    [self.toggleView showReminderPoperWithText:@"popopopopopopopopop\npapapapapapapapap\nbiubiubiubiubiubiu" reminderKey:keyId];
}


- (IBAction)clearAllReminders:(id)sender
{
    [self.toggleView clearReminders];
    [self.view clearReminders];
}


- (void)panView:(UIPanGestureRecognizer *)pan
{
    if (pan.state != UIGestureRecognizerStateEnded && pan.state != UIGestureRecognizerStateFailed) {
        CGPoint location = [pan translationInView:self.toggleView];
        
        self.toggleView.center = CGPointMake(self.toggleView.center.x +location.x , self.toggleView.center.y + location.y);
        //每次移动完，将移动量置为0，否则下次移动会加上这次移动量
        [pan setTranslation:CGPointMake(0, 0) inView:self.toggleView];
    }

}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
