//
//  UIImageView+ImageView.h
//  timeApp
//
//  Created by 马淑栋 on 2019/4/8.
//  Copyright © 2019 马淑栋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (ImageView)
-(instancetype)initWithbackCorlor:(UIColor *)backColor cornerRadiusSize:(NSInteger)cornerRadiusSize borderWidth:(NSInteger)borderWidthSize borderColor:(UIColor *)borderColor imageName:(NSString *)imageNameStr;
@end

NS_ASSUME_NONNULL_END
