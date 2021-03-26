//
//  Operation_relyOn.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/25.
//

#import "Operation_relyOn.h"

@interface Operation_relyOn ()

@end

@implementation Operation_relyOn

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addDependency];
}

- (void)addDependency {

    // 1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];

    // 2.创建操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
    }];
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
    }];

    // 3.添加依赖
    [op2 addDependency:op1]; // 让op2 依赖于 op1，则先执行op1，在执行op2
    [op3 addDependency:op2]; // 让op3 依赖于 op2，

    // 4.添加操作到队列中
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
}


@end
