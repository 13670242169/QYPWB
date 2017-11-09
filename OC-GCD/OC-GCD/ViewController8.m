//
//  ViewController8.m
//  OC-GCD
//
//  Created by Apple on 2017/11/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController8.h"

@interface ViewController8 ()

@end

@implementation ViewController8

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self syncMain];
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(queue, ^{
        [self syncMain];
    });
    /*
     2017-11-09 14:57:11.657470+0800 OC-GCD[19151:1240132] syncMain---begin
     2017-11-09 14:57:11.736646+0800 OC-GCD[19151:1240099] 1------<NSThread: 0x1c0065f00>{number = 1, name = main}
     2017-11-09 14:57:11.736871+0800 OC-GCD[19151:1240099] 1------<NSThread: 0x1c0065f00>{number = 1, name = main}
     2017-11-09 14:57:11.737754+0800 OC-GCD[19151:1240099] 2------<NSThread: 0x1c0065f00>{number = 1, name = main}
     2017-11-09 14:57:11.737893+0800 OC-GCD[19151:1240099] 2------<NSThread: 0x1c0065f00>{number = 1, name = main}
     2017-11-09 14:57:11.738221+0800 OC-GCD[19151:1240099] 3------<NSThread: 0x1c0065f00>{number = 1, name = main}
     2017-11-09 14:57:11.738439+0800 OC-GCD[19151:1240099] 3------<NSThread: 0x1c0065f00>{number = 1, name = main}
     2017-11-09 14:57:11.738546+0800 OC-GCD[19151:1240132] syncMain---end

     在其他线程中使用主队列 + 同步执行可看到：所有任务都是在主线程中执行的，并没有开启新的线程。而且由于主队列是串行队列，所以按顺序一个一个执行。
     同时我们还可以看到，所有任务都在打印的syncConcurrent---begin和syncConcurrent---end之间，这说明任务是添加到队列中马上执行的。

  
     */
}
/**
 主队列 + 同步执行
 2017-11-09 14:54:42.504728+0800 OC-GCD[19139:1239208] syncMain---begin
 (lldb)
 这时候，我们惊奇的发现，在主线程中使用主队列 + 同步执行，任务不再执行了，而且syncMain---end也没有打印。这是为什么呢？

 这是因为我们在主线程中执行这段代码。我们把任务放到了主队列中，也就是放到了主线程的队列中。而同步执行有个特点，就是对于任务是立马执行的。那么当我们把第一个任务放进主队列中，它就会立马执行。但是主线程现在正在处理syncMain方法，所以任务需要等syncMain执行完才能执行。而syncMain执行到第一个任务的时候，又要等第一个任务执行完才能往下执行第二个和第三个任务。

 */
-(void)syncMain{
    NSLog(@"syncMain---begin");
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"1------%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"2------%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"3------%@",[NSThread currentThread]);
        }
    });
    NSLog(@"syncMain---end");
}
@end
