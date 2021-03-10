//
//  UIImageView+ImageView.m
//  timeApp
//
//  Created by 马淑栋 on 2019/4/8.
//  Copyright © 2019 马淑栋. All rights reserved.
//

#import "UIImageView+ImageView.h"

@implementation UIImageView (ImageView)

-(instancetype)initWithbackCorlor:(UIColor *)backColor cornerRadiusSize:(NSInteger)cornerRadiusSize borderWidth:(NSInteger)borderWidthSize borderColor:(UIColor *)borderColor imageName:(NSString *)imageNameStr{
    
    if (self = [super init]) {
        self.backgroundColor = backColor;//设置背景颜色
        self.layer.cornerRadius = cornerRadiusSize;//设置圆角效果
        self.layer.borderWidth = borderWidthSize;// 边框线宽
        self.image = [UIImage imageNamed:imageNameStr];//设置背景图片
    }
    return self;
}

@end
