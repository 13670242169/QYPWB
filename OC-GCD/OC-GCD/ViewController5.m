//
//  ViewController5.m
//  OC-GCD
//
//  Created by Apple on 2017/11/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController5.h"

@interface ViewController5 ()

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self asyncConcurrent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 并行队列-异步任务
 */
-(void)asyncConcurrent{
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"syncConcurrent---begin");
    dispatch_async(queue, ^{
        for (int i = 0; i < 200; ++i) {
            NSLog(@"1------%@",[NSThread currentThread]);
        }
    });

    dispatch_async(queue, ^{
        for (int i = 0; i < 200; ++i) {
            NSLog(@"2------%@",[NSThread currentThread]);
        }
    });

    dispatch_async(queue, ^{
        for (int i = 0; i < 200; ++i) {
            NSLog(@"3------%@",[NSThread currentThread]);
        }
    });
    NSLog(@"syncConcurrent---end");
}
// 最好循环多一点,才可得出效果
/*
 2017-11-09 14:26:36.679888+0800 OC-GCD[19015:1229222] syncConcurrent---begin
 2017-11-09 14:26:36.680199+0800 OC-GCD[19015:1229222] syncConcurrent---end
 2017-11-09 14:26:36.682457+0800 OC-GCD[19015:1229256] 1------<NSThread: 0x1c0464880>{number = 3, name = (null)}
 2017-11-09 14:26:36.684929+0800 OC-GCD[19015:1229256] 1------<NSThread: 0x1c0464880>{number = 3, name = (null)}
 2017-11-09 14:26:36.685319+0800 OC-GCD[19015:1229259] 3------<NSThread: 0x1c0464900>{number = 5, name = (null)}
 2017-11-09 14:26:36.685583+0800 OC-GCD[19015:1229259] 2------<NSThread: 0x1c0464900>{number = 4, name = (null)}
 2017-11-09 14:26:36.686399+0800 OC-GCD[19015:1229253] 3------<NSThread: 0x1c0464800>{number = 5, name = (null)}
 2017-11-09 14:26:36.686794+0800 OC-GCD[19015:1229253] 3------<NSThread: 0x1c0464800>{number = 5, name = (null)}
 */
// 在并行,异步中可以看出,除主线程外,海开启了3个线程,并且任务交替执行
//另一方面可以看出，所有任务是在打印的syncConcurrent---begin和syncConcurrent---end之后才开始执行的。说明任务不是马上执行，而是将所有任务添加到队列之后才开始异步执行。




@end
