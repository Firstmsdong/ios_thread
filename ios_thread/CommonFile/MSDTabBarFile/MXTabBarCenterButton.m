//
//  MXTabBarCenterButton.m
//  MXTabBarController
//
//  Created by Apple on 16/5/3.
//  Copyright © 2016年 韦纯航. All rights reserved.
//

#import "MXTabBarCenterButton.h"

@implementation MXTabBarCenterButton

+ (instancetype)centerButton
{
    MXTabBarCenterButton *button = [[MXTabBarCenterButton alloc] init];
    [button setAdjustsImageWhenHighlighted:NO];
    [button setImage:[UIImage imageNamed:@"tabbar_middle"] forState:UIControlStateNormal];
    return button;
}

@end
