//
//  Operation_Queue_creat.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/25.
//

#import "Operation_Queue_creat.h"

@interface Operation_Queue_creat ()

@end

@implementation Operation_Queue_creat

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 主队列获取方法
    NSOperationQueue *queueMian = [NSOperationQueue mainQueue];
    
    // 自定义队列创建方法
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
}

@end
