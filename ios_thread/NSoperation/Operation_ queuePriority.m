//
//  Operation_ queuePriority.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/25.
//

#import "Operation_ queuePriority.h"

@interface Operation__queuePriority ()
@property(nonatomic,strong)NSOperationQueue * queue;
@end

@implementation Operation__queuePriority

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatqueuePriority];
}
-(NSOperationQueue *)queue{
   if(_queue==nil){
    _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}
-(void)creatqueuePriority{
    /*
     typedef NS_ENUM(NSInteger, NSOperationQueuePriority) {
         NSOperationQueuePriorityVeryLow = -8L,
         NSOperationQueuePriorityLow = -4L,
         NSOperationQueuePriorityNormal = 0,
         NSOperationQueuePriorityHigh = 4,
         NSOperationQueuePriorityVeryHigh = 8
     };
     */
    //操作1
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1------%@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:1];
       
    }];
    
    //操作2
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2------%@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:3];
        
    }];
    
    [self.queue addOperation:op1];
    [self.queue addOperation:op2];
    
    //设置优先级最低
    [op1 setQueuePriority:NSOperationQueuePriorityLow];
    //设置优先级最高
    [op2 setQueuePriority:NSOperationQueuePriorityVeryHigh];
    
    
    
}

@end
