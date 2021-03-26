//
//  Operation_creat.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/25.
//

#import "Operation_creat.h"
#import "Operation_child.h"
@interface Operation_creat ()

@end

@implementation Operation_creat

- (void)viewDidLoad {
    [super viewDidLoad];
    /* 1.  使用 NSInvocationOperation 创建   */
    //NSInvocationOperation 的创建
    //[NSThread detachNewThreadSelector:@selector(creatNSInvocationOperation) toTarget:self withObject:nil];
    //[self creatNSInvocationOperation];
    
    
    /* 2.  使用 NSBlockOperation 创建   */
    //[NSThread detachNewThreadSelector:@selector(creatNSBlockOperation) toTarget:self withObject:nil];
    //[self creatNSBlockOperation];
    
    /* 2.1. 使用 NSBlockOperation ----  addExecutionBlock 创建*/
   // [NSThread detachNewThreadSelector:@selector(creatNSBlockAddExectionBlock) toTarget:self withObject:nil];
    //[self creatNSBlockAddExectionBlock];
    
    /*3. 自定义继承自 NSOperation 的子类*/
    [NSThread detachNewThreadSelector:@selector(creatNSOperationChild) toTarget:self withObject:nil];
    //[self creatNSOperationChild];
    
}
#pragma mark NSInvocationOperation
-(void)creatNSInvocationOperation{
    //创建 NSInvocationOperation 对象
    NSInvocationOperation * invocation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationTask) object:nil];
    //调用 start 方法开始执行操作
    [invocation start];
}
-(void)invocationTask{
    
    for (int i = 0; i < 3; i++) {
        // 模拟耗时操作
        [NSThread sleepForTimeInterval:2];
        // 打印当前线程
        NSLog(@"%d---%@",i,[NSThread currentThread]);
    }
}

#pragma mark NSBlockOperation
-(void)creatNSBlockOperation{
    //创建NSBlockOperation
    NSBlockOperation * blockOperation = [NSBlockOperation blockOperationWithBlock:^{
       
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"%d------%@",i,[NSThread currentThread]);
        }
        
    }];
    
    [blockOperation start];
}
    
#pragma mark NSBlockOperation - addExecutionBlock
-(void)creatNSBlockAddExectionBlock{
    //创建NSBlockOperation
    NSLog(@"当前线程 ------ %@",[NSThread currentThread]);
    NSBlockOperation * blockOperation = [NSBlockOperation blockOperationWithBlock:^{
//            [NSThread sleepForTimeInterval:2];
//            NSLog(@"任务1 ------ %@",[NSThread currentThread]);
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"任务1---%@", [NSThread currentThread]); // 打印当前线程
       }

       
    }];
   
    [blockOperation addExecutionBlock:^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"任务2 ------ %@",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"任务3 ------ %@",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"任务4 ------ %@",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"任务5 ------ %@",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"任务6 ------ %@",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"任务7 ------ %@",[NSThread currentThread]);
    }];
    blockOperation.completionBlock = ^{
        NSLog(@"完成任务 ------ %@",[NSThread currentThread]);
    };
    [blockOperation start];
}
    
#pragma mark 自定义继承自 NSOperation 的子类
-(void)creatNSOperationChild{
    Operation_child * operationChild = [[Operation_child alloc] init];
    [operationChild start];
}
    

    
@end
