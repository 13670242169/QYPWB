//
//  ViewController9.m
//  OC-GCD
//
//  Created by Apple on 2017/11/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController9.h"

@interface ViewController9 ()

@end

@implementation ViewController9

- (void)viewDidLoad {
    [super viewDidLoad];
    [self asyncMain];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 主队列 + 异步执行
 */
- (void)asyncMain
{
    NSLog(@"asyncMain---begin");

    dispatch_queue_t queue = dispatch_get_main_queue();

    dispatch_async(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"1------%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"2------%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"3------%@",[NSThread currentThread]);
        }
    });

    NSLog(@"asyncMain---end");
}
/*

 2017-11-09 15:00:00.414001+0800 OC-GCD[19163:1241007] asyncMain---begin
 2017-11-09 15:00:00.414308+0800 OC-GCD[19163:1241007] asyncMain---end
 2017-11-09 15:00:00.492795+0800 OC-GCD[19163:1241007] 1------<NSThread: 0x1c0071cc0>{number = 1, name = main}
 2017-11-09 15:00:00.493099+0800 OC-GCD[19163:1241007] 1------<NSThread: 0x1c0071cc0>{number = 1, name = main}
 2017-11-09 15:00:00.493224+0800 OC-GCD[19163:1241007] 2------<NSThread: 0x1c0071cc0>{number = 1, name = main}
 2017-11-09 15:00:00.493301+0800 OC-GCD[19163:1241007] 2------<NSThread: 0x1c0071cc0>{number = 1, name = main}
 2017-11-09 15:00:00.493379+0800 OC-GCD[19163:1241007] 3------<NSThread: 0x1c0071cc0>{number = 1, name = main}
 2017-11-09 15:00:00.493451+0800 OC-GCD[19163:1241007] 3------<NSThread: 0x1c0071cc0>{number = 1, name = main}

 我们发现所有任务都在主线程中，虽然是异步执行，具备开启线程的能力，但因为是主队列，所以所有任务都在主线程中，并且一个接一个执行。
 另一方面可以看出，所有任务是在打印的syncConcurrent---begin和syncConcurrent---end之后才开始执行的。说明任务不是马上执行，而是将所有任务添加到队列之后才开始同步执行。


 */



@end
