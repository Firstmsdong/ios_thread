//
//  UIButton+MSDButton.m
//  timeApp
//
//  Created by 马淑栋 on 2019/4/9.
//  Copyright © 2019 马淑栋. All rights reserved.
//

#import "UIButton+MSDButton.h"

@implementation UIButton (MSDButton)

+ (UIButton *)buttonWithbuttonType:(UIButtonType)buttonType andText:(NSString *)text andTextAlignment:(UIControlContentHorizontalAlignment)alignment andTextColor:(UIColor *)color andTextFont:(CGFloat)font andBackgroungColor:(UIColor *)bgColor cornerRadiusSize:(NSInteger)cornerRadiusSize borderWidth:(NSInteger)borderWidthSize borderColor:(UIColor *)borderColor abscissa:(CGFloat)abscissa ordinate:(CGFloat)ordinate width:(CGFloat)width height:(CGFloat)height {
    
    UIButton *button = [UIButton buttonWithType:buttonType];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.contentHorizontalAlignment=alignment;
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    button.backgroundColor = bgColor;
    [button.layer setCornerRadius:cornerRadiusSize]; //圆角半径；
    [button.layer setBorderColor:borderColor.CGColor]; //设置边框颜色
    [button.layer setBorderWidth:borderWidthSize];
    button.frame = CGRectMake(abscissa, ordinate, width, height);
    return button;
}

- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color{
    
    // 倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
        // 倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.backgroundColor = mColor;
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = timeOut % 60;
            NSString * timeStr = [NSString stringWithFormat:@"%0.2d",seconds];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = color;
                [self setTitle:[NSString stringWithFormat:@"%@%@",timeStr,subTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            
            timeOut--;
        }
    });
    
    dispatch_resume(_timer);
}
@end
