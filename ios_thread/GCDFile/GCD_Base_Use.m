//
//  GCD_Base_Use.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/23.
//

#import "GCD_Base_Use.h"

@interface GCD_Base_Use ()

@end

@implementation GCD_Base_Use

- (void)viewDidLoad {
    [super viewDidLoad];
    //同步执行+并发队列
//    [self syncConcurrent];
    //异步执行+并发队列
    //[self asyncConcurrent];
    //同步执行+串行队列
    //[self syncSerial];
    //异步执行+串行队列
    //[self asyncSerial];
    //同步执行 + 主队列
    //[self syncMain];
    // 使用 NSThread 的 detachNewThreadSelector 方法会创建线程，并自动启动线程执行selector 任务
    //[NSThread detachNewThreadSelector:@selector(syncMain) toTarget:self withObject:nil];
    //异步执行 + 主队列
    //[self asyncMain];
    [self communication];
}
#pragma mark 同步执行+并发队列
/**
 * 同步执行 + 并发队列
 * 特点：在当前线程中执行任务，不会开启新线程，执行完一个任务，再执行下一个任务。
 */
- (void)syncConcurrent {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"begin");
    
    dispatch_queue_t queue = dispatch_queue_create("net.thread.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"1---%@",[NSThread currentThread]);
        }
    });

    dispatch_sync(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"2---%@",[NSThread currentThread]);
        }
    });

    dispatch_sync(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"3---%@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"end");
}
#pragma mark 异步执行并发队列
/**
 * 异步执行 + 并发队列
 * 特点：可以开启多个线程，任务交替（同时）执行。
 */
- (void)asyncConcurrent {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"begin");

    dispatch_queue_t queue = dispatch_queue_create("net.thread.testQueue", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 3; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"1---%@",[NSThread currentThread]);
        }
    });

    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 1; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"2---%@",[NSThread currentThread]);
        }
    });

    dispatch_async(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"3---%@",[NSThread currentThread]);
        }
    });

    NSLog(@"asyncConcurrent---end");
}
#pragma mark 同步执行 + 串行队列
/**
 * 同步执行 + 串行队列
 * 特点：不会开启新线程，在当前线程执行任务。任务是串行的，执行完一个任务，再执行下一个任务。
 */
- (void)syncSerial {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"syncSerial---begin");

    dispatch_queue_t queue = dispatch_queue_create("net.thread.testQueue", DISPATCH_QUEUE_SERIAL);

    dispatch_sync(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"1---%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"2---%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"3---%@",[NSThread currentThread]);
        }
    });

    NSLog(@"syncSerial---end");
}
#pragma mark 异步执行 + 串行队列
/**
 * 异步执行 + 串行队列
 * 特点：会开启新线程，但是因为任务是串行的，执行完一个任务，再执行下一个任务。
 */
- (void)asyncSerial {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncSerial---begin");

    dispatch_queue_t queue = dispatch_queue_create("net.thread.testQueue", DISPATCH_QUEUE_SERIAL);

    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"1---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"2---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"3---%@",[NSThread currentThread]);
        }
    });

    NSLog(@"asyncSerial---end");
}
#pragma mark 同步执行 + 主队列
/**
 * 同步执行 + 主队列
 * 特点(主线程调用)：互等卡主不执行。
 * 特点(其他线程调用)：不会开启新线程，执行完一个任务，再执行下一个任务。
 */
- (void)syncMain {

    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"syncMain---begin");

    dispatch_queue_t queue = dispatch_get_main_queue();

    dispatch_sync(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });

    dispatch_sync(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });

    NSLog(@"syncMain---end");
}
#pragma mark 异步执行 + 主队列
/**
 * 异步执行 + 主队列
 * 特点：只在主线程中执行任务，执行完一个任务，再执行下一个任务
 */
- (void)asyncMain {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncMain---begin");

    dispatch_queue_t queue = dispatch_get_main_queue();

    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"1---%@",[NSThread currentThread]);
        }
    });

    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"2---%@",[NSThread currentThread]);
        }
    });

    NSLog(@"asyncMain---end");
}
- (void)communication {
    // 获取全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 获取主队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();

    dispatch_async(queue, ^{
        // 异步追加任务
        for (int i = 0; i < 3; ++i) {
            // 模拟耗时操作 例如网络请求
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"1---%@",[NSThread currentThread]);
        }

        // 回到主线程
        dispatch_async(mainQueue, ^{
            // 追加在主线程中执行的任务 例如刷新UI
            // 模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            // 打印当前线程
            NSLog(@"2---%@",[NSThread currentThread]);
        });
    });
}

@end
