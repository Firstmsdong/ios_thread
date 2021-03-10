




//
//  UITextField+MSDTextFile.m
//  timeApp
//
//  Created by 马淑栋 on 2019/4/10.
//  Copyright © 2019 马淑栋. All rights reserved.
//

#import "UITextField+MSDTextFile.h"

@implementation UITextField (MSDTextFile)
-(instancetype)initWithPlaceholderText:(NSString *)placeholderText font:(NSInteger)font textCorlor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment backCorlor:(UIColor *)backColor cornerRadiusSize:(NSInteger)cornerRadiusSize borderWidth:(NSInteger)borderWidthSize borderColor:(UIColor *)borderColor keyStrle:(UIKeyboardType)keyStr{
    
    if (self = [super init]) {
     
        self.placeholder = placeholderText;//水印效果
        self.font = [UIFont  systemFontOfSize:font];
        self.textColor = textColor;
        self.textAlignment = textAlignment;
        self.backgroundColor = backColor;
        self.layer.cornerRadius =cornerRadiusSize;
        [self.layer setBorderWidth:borderWidthSize];
        [self.layer setBorderColor:borderColor.CGColor];
        self.keyboardType = keyStr;
    }
    return self;
}


@end
