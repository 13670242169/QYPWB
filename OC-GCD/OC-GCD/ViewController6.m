//
//  ViewController6.m
//  OC-GCD
//
//  Created by Apple on 2017/11/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController6.h"

@interface ViewController6 ()

@end

@implementation ViewController6

- (void)viewDidLoad {
    [super viewDidLoad];
    [self syncSerial];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 3. 串行队列 + 同步执行
-(void)syncSerial{
     NSLog(@"syncSerial---begin");
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        for (int i = 0; i < 10; ++i) {
            NSLog(@"1------%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 10; ++i) {
            NSLog(@"2------%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 10; ++i) {
            NSLog(@"3------%@",[NSThread currentThread]);
        }
    });
    NSLog(@"syncSerial---end");

}
// 串行队列 + 同步执行可以看到,所有的任务都是在主线程中执行的,没有开启新的线程,而且由于串行队列,所有按循序一个一个执行,,,
// 我们还可以看到,所有的打印都是在添加到队列以后马上执行
/*
 2017-11-09 14:35:44.407081+0800 OC-GCD[19055:1232511] syncSerial---begin
 2017-11-09 14:35:44.407639+0800 OC-GCD[19055:1232511] 1------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.407915+0800 OC-GCD[19055:1232511] 1------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.408159+0800 OC-GCD[19055:1232511] 1------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.408394+0800 OC-GCD[19055:1232511] 1------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.408622+0800 OC-GCD[19055:1232511] 1------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.408850+0800 OC-GCD[19055:1232511] 1------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.409076+0800 OC-GCD[19055:1232511] 1------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.409298+0800 OC-GCD[19055:1232511] 1------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.409577+0800 OC-GCD[19055:1232511] 1------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.411285+0800 OC-GCD[19055:1232511] 1------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.411551+0800 OC-GCD[19055:1232511] 2------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.411780+0800 OC-GCD[19055:1232511] 2------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.412007+0800 OC-GCD[19055:1232511] 2------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.412540+0800 OC-GCD[19055:1232511] 2------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.412871+0800 OC-GCD[19055:1232511] 2------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.413132+0800 OC-GCD[19055:1232511] 2------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.413371+0800 OC-GCD[19055:1232511] 2------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.413603+0800 OC-GCD[19055:1232511] 2------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.416435+0800 OC-GCD[19055:1232511] 2------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.416706+0800 OC-GCD[19055:1232511] 2------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.417126+0800 OC-GCD[19055:1232511] 3------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.417308+0800 OC-GCD[19055:1232511] 3------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.417463+0800 OC-GCD[19055:1232511] 3------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.418091+0800 OC-GCD[19055:1232511] 3------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.418637+0800 OC-GCD[19055:1232511] 3------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.418792+0800 OC-GCD[19055:1232511] 3------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.418941+0800 OC-GCD[19055:1232511] 3------<NSThread: 0x1c006ed40>{number = 1, name = main}

 2017-11-09 14:35:44.419296+0800 OC-GCD[19055:1232511] 3------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.419452+0800 OC-GCD[19055:1232511] 3------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.419732+0800 OC-GCD[19055:1232511] 3------<NSThread: 0x1c006ed40>{number = 1, name = main}
 2017-11-09 14:35:44.419864+0800 OC-GCD[19055:1232511] syncSerial---end
 */

@end
