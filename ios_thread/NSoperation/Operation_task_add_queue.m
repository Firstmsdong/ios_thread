//
//  Opration_task_add_queue.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/25.
//

#import "Operation_task_add_queue.h"

@interface Operation_task_add_queue ()

@end

@implementation Operation_task_add_queue

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self addOperationQueue];
    [self addOperationWithBlock];
}

#pragma mark - (void)addOperation:(NSOperation *)op
-(void)addOperationQueue{
    //创建队列
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    //创建操作1
    NSInvocationOperation  *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task1) object:nil];
    //创建操作2
    NSInvocationOperation  *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task2) object:nil];
    //创建操作3
    NSBlockOperation * op3 = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:2]; // 模拟耗时操
        NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
    }];
    [op3 addExecutionBlock:^{
        [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
        NSLog(@"4---%@", [NSThread currentThread]); // 打印当前线程
    }];
    // 3.使用 addOperation: 添加所有操作到队列中
    [queue addOperation:op1]; // [op1 start]
    [queue addOperation:op2]; // [op2 start]
    [queue addOperation:op3]; // [op3 start]
}
-(void)task1{
    [NSThread sleepForTimeInterval:2]; // 模拟耗时操
    NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
}
-(void)task2{
    [NSThread sleepForTimeInterval:2]; // 模拟耗时操
    NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
}

#pragma mark - (void)addOperationWithBlock:(void (^)(void))block
- (void)addOperationWithBlock{
    //创建队列
    NSOperationQueue * blockQueue = [[NSOperationQueue alloc] init];
    
    [blockQueue addOperationWithBlock:^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"1---- %@",[NSThread currentThread]);
    }];
    
    [blockQueue addOperationWithBlock:^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"2---- %@",[NSThread currentThread]);
    }];
    
    [blockQueue addOperationWithBlock:^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"3---- %@",[NSThread currentThread]);
    }];
}

@end
