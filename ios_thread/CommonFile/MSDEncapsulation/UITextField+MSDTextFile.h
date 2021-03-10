//
//  UITextField+MSDTextFile.h
//  timeApp
//
//  Created by 马淑栋 on 2019/4/10.
//  Copyright © 2019 马淑栋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (MSDTextFile)

/*
 键盘风格
 */

-(instancetype)initWithPlaceholderText:(NSString *)placeholderText font:(NSInteger)font textCorlor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment backCorlor:(UIColor *)backColor cornerRadiusSize:(NSInteger)cornerRadiusSize borderWidth:(NSInteger)borderWidthSize borderColor:(UIColor *)borderColor keyStrle:(UIKeyboardType)keyStr;


@end

NS_ASSUME_NONNULL_END
