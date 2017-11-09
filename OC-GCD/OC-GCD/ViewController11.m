//
//  ViewController11.m
//  OC-GCD
//
//  Created by Apple on 2017/11/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController11.h"

@interface ViewController11 ()

@end

@implementation ViewController11


- (void)viewDidLoad {
    [super viewDidLoad];
    [self barrier];
}

/**
 GCD的栅栏方法

 我们有时需要异步执行两组操作，而且第一组操作执行完之后，才能开始执行第二组操作。这样我们就需要一个相当于栅栏一样的一个方法将两组异步执行的操作组给分割起来，当然这里的操作组里可以包含一个或多个任务。这就需要用到dispatch_barrier_async方法在两个操作组间形成栅栏。
 */

- (void)barrier
{
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(queue, ^{
        for (int i = 0 ; i < 100; i ++) {
            NSLog(@"----1-----%@", [NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 100; i ++) {
            NSLog(@"----2-----%@", [NSThread currentThread]);
        }
    });

    dispatch_barrier_async(queue, ^{
        NSLog(@"----barrier-----%@", [NSThread currentThread]);
    });

    dispatch_async(queue, ^{
        NSLog(@"----3-----%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"----4-----%@", [NSThread currentThread]);
    });
}
//可以看出在执行完栅栏前面的操作之后，才执行栅栏操作，最后再执行栅栏后边的操作。
/*
 2017-11-09 15:20:15.032377+0800 OC-GCD[19262:1249255] ----1-----<NSThread: 0x1c0672000>{number = 3, name = (null)}
 2017-11-09 15:20:15.032567+0800 OC-GCD[19262:1249255] ----1-----<NSThread: 0x1c0672000>{number = 3, name = (null)}
 2017-11-09 15:20:15.032635+0800 OC-GCD[19262:1249255] ----1-----<NSThread: 0x1c0672000>{number = 3, name = (null)}
 2017-11-09 15:20:15.032703+0800 OC-GCD[19262:1249255] ----1-----<NSThread: 0x1c0672000>{number = 3, name = (null)}
 2017-11-09 15:20:15.032772+0800 OC-GCD[19262:1249255] ----1-----<NSThread: 0x1c0672000>{number = 3, name = (null)}
 2017-11-09 15:20:15.033309+0800 OC-GCD[19262:1249255] ----barrier-----<NSThread: 0x1c0672000>{number = 3, name = (null)}
 2017-11-09 15:20:15.033465+0800 OC-GCD[19262:1249255] ----3-----<NSThread: 0x1c0672000>{number = 3, name = (null)}
 2017-11-09 15:20:15.033625+0800 OC-GCD[19262:1249255] ----4-----<NSThread: 0x1c0672000>{number = 3, name = (null)}
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
