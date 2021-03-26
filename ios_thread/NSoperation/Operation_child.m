//
//  Operation_child.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/25.
//

#import "Operation_child.h"

@implementation Operation_child

-(void)main{
    if (!self.isCancelled) {
        [NSThread sleepForTimeInterval:2];
        NSLog(@"----%@",[NSThread currentThread]);
    }
}

@end
