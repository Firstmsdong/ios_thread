//
//  GCD_dispatch_apply.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/24.
//

#import "GCD_dispatch_apply.h"

@interface GCD_dispatch_apply ()

@end

@implementation GCD_dispatch_apply

- (void)viewDidLoad {
    [super viewDidLoad];
    [self apply];
}
- (void)apply {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSLog(@"apply---begin");
    dispatch_apply(5, queue, ^(size_t index) {
        NSLog(@"%zd---%@",index, [NSThread currentThread]);
    });
    NSLog(@"apply---end");
}

@end
