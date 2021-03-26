//
//  GCD_dispatch_barrier_async.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/24.
//

#import "GCD_dispatch_barrier_async.h"

@interface GCD_dispatch_barrier_async ()

@end

@implementation GCD_dispatch_barrier_async

- (void)viewDidLoad {
    [super viewDidLoad];
     
    //同步栅栏
    //[self barrierSync];
    //异步栅栏
    [self barrierAsync];
}
- (void)barrierSync {
    NSLog(@"当前线程1");
    dispatch_queue_t queue = dispatch_queue_create("net.thread.testQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"开始下载part1 -> %@",[NSThread currentThread]);
        //这里模拟下载操作
        [NSThread sleepForTimeInterval:2];
        NSLog(@"完成part1下载 -> %@",[NSThread currentThread]);
    });
    NSLog(@"当前线程2");
    dispatch_async(queue, ^{
        NSLog(@"开始下载part2 -> %@",[NSThread currentThread]);
        //这里模拟下载操作
        [NSThread sleepForTimeInterval:4];
        NSLog(@"完成part2下载 -> %@",[NSThread currentThread]);
    });
    NSLog(@"当前线程3");
    dispatch_barrier_sync(queue, ^{
        NSLog(@"合并part1和part2 -> %@",[NSThread currentThread]);
        //模拟合并操作
        [NSThread sleepForTimeInterval:2];
        NSLog(@"合并part1和part2合并完成 -> %@",[NSThread currentThread]);
    });
    NSLog(@"当前线程4");

}
- (void)barrierAsync {
    NSLog(@"当前线程1");
    dispatch_queue_t queue = dispatch_queue_create("net.thread.testQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"开始下载part1 -> %@",[NSThread currentThread]);
        //这里模拟下载操作
        [NSThread sleepForTimeInterval:2];
        NSLog(@"完成part1下载 -> %@",[NSThread currentThread]);
    });
    NSLog(@"当前线程2");
    dispatch_async(queue, ^{
        NSLog(@"开始下载part2 -> %@",[NSThread currentThread]);
        //这里模拟下载操作
        [NSThread sleepForTimeInterval:4];
        NSLog(@"完成part2下载 -> %@",[NSThread currentThread]);
    });
    NSLog(@"当前线程3");
    dispatch_barrier_async(queue, ^{
        NSLog(@"合并part1和part2 -> %@",[NSThread currentThread]);
        //模拟合并操作
        [NSThread sleepForTimeInterval:2];
        NSLog(@"合并part1和part2合并完成 -> %@",[NSThread currentThread]);
    });
    NSLog(@"当前线程4");

}
@end
