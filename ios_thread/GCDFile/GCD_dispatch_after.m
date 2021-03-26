//
//  GCD_dispatch_after.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/24.
//

#import "GCD_dispatch_after.h"

@interface GCD_dispatch_after ()

@end

@implementation GCD_dispatch_after

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dispatch_after];
}
/**
 * 延时执行方法 dispatch_after
 */
- (void)dispatch_after {
    // 打印当前线程
    NSLog(@"currentThread---%@",[NSThread currentThread]);
    NSLog(@"asyncMain---begin");

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 2.0秒后异步追加任务代码到主队列，并开始执行
        // 打印当前线程
        NSLog(@"after---%@",[NSThread currentThread]);
    });
}

@end
