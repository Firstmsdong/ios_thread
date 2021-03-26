//
//  Operation_Control_queueWay.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/25.
//

#import "Operation_Control_queueWay.h"

@interface Operation_Control_queueWay ()

@end

@implementation Operation_Control_queueWay

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setMaxConcurrentOperationCount];
    
}
- (void)setMaxConcurrentOperationCount {

    // 1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 2.设置最大并发操作数
    //情况1：不做任何设置 默认 maxConcurrentOperationCount == -1
    
    //情况2：maxConcurrentOperationCount == 1-----// 串行队列
    //queue.maxConcurrentOperationCount = 1;
    
    //情况3：maxConcurrentOperationCount >1 -----并发队列
   // queue.maxConcurrentOperationCount = 2; 
    queue.maxConcurrentOperationCount = 4; // 并发队列

    // 3.添加操作
    [queue addOperationWithBlock:^{
        // 模拟耗时操作
        [NSThread sleepForTimeInterval:2];
        // 打印当前线程
        NSLog(@"1---%@", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        // 模拟耗时操作
        [NSThread sleepForTimeInterval:2];
        // 打印当前线程
        NSLog(@"2---%@", [NSThread currentThread]);
        
    }];
    [queue addOperationWithBlock:^{
        // 模拟耗时操作
        [NSThread sleepForTimeInterval:2];
        // 打印当前线程
        NSLog(@"3---%@", [NSThread currentThread]);
       
    }];
    [queue addOperationWithBlock:^{
        // 模拟耗时操作
        [NSThread sleepForTimeInterval:2];
        // 打印当前线程
        NSLog(@"4---%@", [NSThread currentThread]);
    }];
}


@end
