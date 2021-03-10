//
//  UILabel+Labbel.h
//  MSDEncapsulation
//
//  Created by 马淑栋 on 2019/3/29.
//  Copyright © 2019 马淑栋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Labbel)
-(instancetype)initWithText:(NSString *)text font:(NSInteger)font textCorlor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment backCorlor:(UIColor *)backColor cornerRadiusSize:(NSInteger)cornerRadiusSize borderWidth:(NSInteger)borderWidthSize borderColor:(UIColor *)borderColor;
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
