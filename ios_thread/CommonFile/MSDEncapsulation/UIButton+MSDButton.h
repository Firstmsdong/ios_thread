//
//  UIButton+MSDButton.h
//  timeApp
//
//  Created by 马淑栋 on 2019/4/9.
//  Copyright © 2019 马淑栋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (MSDButton)

//初始化button
+ (UIButton *)buttonWithbuttonType:(UIButtonType)buttonType andText:(NSString *)text andTextAlignment:(UIControlContentHorizontalAlignment)alignment andTextColor:(UIColor *)color andTextFont:(CGFloat)font andBackgroungColor:(UIColor *)bgColor cornerRadiusSize:(NSInteger)cornerRadiusSize borderWidth:(NSInteger)borderWidthSize borderColor:(UIColor *)borderColor abscissa:(CGFloat)abscissa ordinate:(CGFloat)ordinate width:(CGFloat)width height:(CGFloat)height;

/*
 *    倒计时按钮
 *    @param timeLine  倒计时总时间
 *    @param title     还没倒计时的title
 *    @param subTitle  倒计时的子名字 如：时、分
 *    @param mColor    还没倒计时的颜色
 *    @param color     倒计时的颜色
 */

- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
