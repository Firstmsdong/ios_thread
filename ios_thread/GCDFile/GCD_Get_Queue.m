//
//  GCD_Get_Queue.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/22.
//

#import "GCD_Get_Queue.h"

@interface GCD_Get_Queue ()

@end

@implementation GCD_Get_Queue

- (void)viewDidLoad {
    [super viewDidLoad];
    
     /*
      第一个参数表示队列的唯一标识符，用于 DEBUG，可为空，Dispatch Queue 的名称推荐使用应用程序 ID 这种逆序全程域名；
      第二个参数用来识别是串行队列还是并发队列。
      **********DISPATCH_QUEUE_SERIAL 表示串行队列，DISPATCH_QUEUE_CONCURRENT 表示并发队列。
      */
    //创建串行队
//    dispatch_queue_t queueSerial = dispatch_queue_create("gcd.test.queue", DISPATCH_QUEUE_SERIAL);
//    //创建并发队列
//    dispatch_queue_t queueConcurret = dispatch_queue_create("gcd.test.queue", DISPATCH_QUEUE_CONCURRENT);
//
//
//     //主队列获取方法
//    dispatch_queue_t queueMain = dispatch_get_main_queue();
    
//    [self mainQueueTest];
    [self globalQueueTest];
}


-(void)mainQueueTest{
    NSLog(@"全局队列同步");
    for (int i = 0 ; i < 5; i++) {
        dispatch_async(dispatch_get_main_queue(), ^{
            //模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            NSLog(@"%d------%@",i,[NSThread currentThread]);
        });
    }
}
-(void)doSomeThing{
    NSLog(@"do something");
}

-(void)globalQueueTest{
    NSLog(@"全局队列同步");
    for (int i = 0 ; i < 5; i++) {
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //模拟耗时操作
            [NSThread sleepForTimeInterval:2];
            NSLog(@"%d------%@",i,[NSThread currentThread]);
        });
    }
}
@end
