//
//  MXTabBarController.m
//  MXTabBarController
//
//  Created by Apple on 16/5/3.
//  Copyright © 2016年 韦纯航. All rights reserved.
//

#import "MXTabBarController.h"
#import "ViewController.h"
#import "MXTabBar.h"
//#import "MyselyCenterViewController.h"
#define MXTabBarColorFromHexRGBY  [UIColor black]
#define MXTabBarColorFromHexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

@interface MXTabBarController () <MXTabBarDelegate>

@end

@implementation MXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpTabBarItemTextAttributes];
    [self setUpChildViewController];
   // [self setUpTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/**
 *  tabBarItem 的选中和不选中文字属性
 */
- (void)setUpTabBarItemTextAttributes
{
    
    
    // 适配iOS13导致的bug
    if (@available(iOS 13.0, *)) {
        // iOS 13以上
        self.tabBar.tintColor = [UIColor blackColor];
        self.tabBar.unselectedItemTintColor = [UIColor grayColor];
        UITabBarItem *item = [UITabBarItem appearance];
        item.titlePositionAdjustment = UIOffsetMake(0, -2);
        [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateSelected];
    } else {
        // iOS 13以下
        
        
        
        NSDictionary *itemTitleTextAttributesNormal = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12.0], NSFontAttributeName, [UIColor grayColor], NSForegroundColorAttributeName, nil];
        NSDictionary *itemTitleTextAttributesSelected = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12.0], NSFontAttributeName, [UIColor blackColor], NSForegroundColorAttributeName, nil];
        [[UITabBarItem appearance] setTitleTextAttributes:itemTitleTextAttributesNormal forState:UIControlStateNormal];
        [[UITabBarItem appearance] setTitleTextAttributes:itemTitleTextAttributesSelected forState:UIControlStateSelected];
        
    
//        UITabBarItem *item = [UITabBarItem appearance];
//        item.titlePositionAdjustment = UIOffsetMake(0, -2);
//        [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:RGB_HEX(0x999999)} forState:UIControlStateNormal];
//        [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:RGB_HEX(0xfb5400)} forState:UIControlStateSelected];
    }
    
    
    
    
    
    
}

/**
 *  添加子控制器
 */
- (void)setUpChildViewController
{

    NSThreadAll * threadC = [[NSThreadAll alloc] init];
    GCDAll * gcdC = [[GCDAll alloc] init];
    NSOperationAll * operationC = [[NSOperationAll alloc] init];
    
    UINavigationController * threadNav = [[UINavigationController alloc] initWithRootViewController:threadC];
    UINavigationController * gcdNav = [[UINavigationController alloc] initWithRootViewController:gcdC];
    UINavigationController * operationNav = [[UINavigationController alloc] initWithRootViewController:operationC];
    
    
    [self addChildViewController:threadNav title:@"NSThread" normalImage:@"tabbar_icon01" selectedImage:@"tabbar_icon01_fill"];
    [self addChildViewController:gcdNav title:@"GCD" normalImage:@"tabbar_icon01" selectedImage:@"tabbar_icon01_fill"];
    [self addChildViewController:operationNav title:@"NSOperation" normalImage:@"tabbar_icon01" selectedImage:@"tabbar_icon01_fill"];
    
}
- (void)setUpTabBar
{
    if ([self respondsToSelector:NSSelectorFromString(@"tabBar")]) {
        MXTabBar *tabBar = [MXTabBar new];
        [tabBar setMxDelegate:self];
        [self setValue:tabBar forKey:@"tabBar"];
    }
}

/**
 *  添加一个子控制器
 *
 *  @param viewController 控制器
 *  @param title          标题
 *  @param imageNormal    默认Item图片
 *  @param imageSelected  选中Item图片
 */
- (void)addChildViewController:(UIViewController *)viewController
                         title:(NSString *)title
                   normalImage:(NSString *)imageNormal
                 selectedImage:(NSString *)imageSelected
{
    
    viewController.view.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:1.00];
    
    UIImage *image = [[UIImage imageNamed:imageNormal] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:imageSelected] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.selectedImage = selectedImage;
    viewController.tabBarItem.title = title;
    
    [self addChildViewController:viewController];
}

#pragma mark - MXTabBarDelegate

- (void)tabBar:(MXTabBar *)tabBar didSelectCenterButtonItem:(MXTabBarCenterButton *)buttonItem
{
    

   
    
}

@end
