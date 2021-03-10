//
//  UILabel+Labbel.m
//  MSDEncapsulation
//
//  Created by 马淑栋 on 2019/3/29.
//  Copyright © 2019 马淑栋. All rights reserved.
//

#import "UILabel+Labbel.h"

@implementation UILabel (Labbel)


-(instancetype)initWithText:(NSString *)text font:(NSInteger)font textCorlor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment backCorlor:(UIColor *)backColor cornerRadiusSize:(NSInteger)cornerRadiusSize borderWidth:(NSInteger)borderWidthSize borderColor:(UIColor *)borderColor{
    
    if (self=[super init]) {
        
        self.text = text; //标签内容
        self.font = [UIFont systemFontOfSize:font];//标签字体
        self.textColor = textColor;//标签字体颜色
        self.textAlignment = textAlignment; //标签位置
        self.backgroundColor = backColor;//标签背景颜色
        self.clipsToBounds = true;// 如果子视图的范围超出了父视图的边界，那么超出的部分就会被裁剪掉。
        self.layer.cornerRadius = cornerRadiusSize;// 圆角的半径
        self.layer.borderWidth = borderWidthSize;// 边框线宽
        self.layer.borderColor = borderColor.CGColor;
    }
    
    return self;
    
}
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return ceil(height);
}

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    CGFloat width = label.frame.size.width;
    return ceil(width);
}

@end

