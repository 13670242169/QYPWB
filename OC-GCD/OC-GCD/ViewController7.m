//
//  ViewController7.m
//  OC-GCD
//
//  Created by Apple on 2017/11/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController7.h"

@interface ViewController7 ()

@end

@implementation ViewController7

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self asyncSerial];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 串行,异步
 */
-(void)asyncSerial{
    NSLog(@"asyncSerial---begin");
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; ++i) {
            NSLog(@"1------%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; ++i) {
            NSLog(@"2------%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; ++i) {
            NSLog(@"3------%@",[NSThread currentThread]);
        }
    });

    NSLog(@"asyncSerial---end");

}
// 在串行队列 + 异步执行可以看出,开启了一个线程,但是人物还是一个一个的执行,
// 所有的任务zai end 之后,说明任务不是马上执行,先加到队列中菜开始执行
/*
 2017-11-09 14:46:28.506708+0800 OC-GCD[19102:1236292] asyncSerial---begin
 2017-11-09 14:46:28.507083+0800 OC-GCD[19102:1236292] asyncSerial---end
 2017-11-09 14:46:28.510787+0800 OC-GCD[19102:1236326] 1------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.511255+0800 OC-GCD[19102:1236326] 1------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.511615+0800 OC-GCD[19102:1236326] 1------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.511850+0800 OC-GCD[19102:1236326] 1------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.512071+0800 OC-GCD[19102:1236326] 1------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.512290+0800 OC-GCD[19102:1236326] 1------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.512508+0800 OC-GCD[19102:1236326] 1------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.512791+0800 OC-GCD[19102:1236326] 1------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.513013+0800 OC-GCD[19102:1236326] 1------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.513229+0800 OC-GCD[19102:1236326] 1------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.513504+0800 OC-GCD[19102:1236326] 2------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.513875+0800 OC-GCD[19102:1236326] 2------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.514103+0800 OC-GCD[19102:1236326] 2------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.514317+0800 OC-GCD[19102:1236326] 2------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.514532+0800 OC-GCD[19102:1236326] 2------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.514749+0800 OC-GCD[19102:1236326] 2------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.515064+0800 OC-GCD[19102:1236326] 2------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.522602+0800 OC-GCD[19102:1236326] 2------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.522821+0800 OC-GCD[19102:1236326] 2------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.523800+0800 OC-GCD[19102:1236326] 2------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.524013+0800 OC-GCD[19102:1236326] 3------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.524169+0800 OC-GCD[19102:1236326] 3------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.524319+0800 OC-GCD[19102:1236326] 3------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.524466+0800 OC-GCD[19102:1236326] 3------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.524614+0800 OC-GCD[19102:1236326] 3------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.524762+0800 OC-GCD[19102:1236326] 3------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.531142+0800 OC-GCD[19102:1236326] 3------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.531339+0800 OC-GCD[19102:1236326] 3------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.531494+0800 OC-GCD[19102:1236326] 3------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 2017-11-09 14:46:28.531643+0800 OC-GCD[19102:1236326] 3------<NSThread: 0x1c027ebc0>{number = 3, name = (null)}
 */

@end
