//
//  ViewController4.m
//  OC-GCD
//
//  Created by Apple on 2017/11/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self syncConCurrent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 1.并行队列 + 同步执行
 2.不会开启新线程,执行完一个任务,在执行下一个任务
 */
-(void) syncConCurrent{
    NSLog(@"syncConCurrent -- begin");
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);

    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 2; i ++) {
            NSLog(@"1-------%@",[NSThread currentThread]);
        }
    });

    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 2; i ++) {
            NSLog(@"2-------%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 2; i ++) {
            NSLog(@"3-------%@",[NSThread currentThread]);
        }
    });
    NSLog(@"syncConCurrent -- end");

}
/*
 2017-11-09 14:09:39.894355+0800 OC-GCD[18944:1223433] syncConCurrent -- begin
 2017-11-09 14:09:39.894867+0800 OC-GCD[18944:1223433] 1-------<NSThread: 0x1c407da40>{number = 1, name = main}
 2017-11-09 14:09:39.895147+0800 OC-GCD[18944:1223433] 1-------<NSThread: 0x1c407da40>{number = 1, name = main}
 2017-11-09 14:09:39.895366+0800 OC-GCD[18944:1223433] 2-------<NSThread: 0x1c407da40>{number = 1, name = main}
 2017-11-09 14:09:39.895664+0800 OC-GCD[18944:1223433] 2-------<NSThread: 0x1c407da40>{number = 1, name = main}
 2017-11-09 14:09:39.896049+0800 OC-GCD[18944:1223433] 3-------<NSThread: 0x1c407da40>{number = 1, name = main}
 2017-11-09 14:09:39.897012+0800 OC-GCD[18944:1223433] 3-------<NSThread: 0x1c407da40>{number = 1, name = main}
 2017-11-09 14:09:39.897601+0800 OC-GCD[18944:1223433] syncConCurrent -- end
 */

//并行队列 + 同步执行 中可以看到,所有任务都是在主线程中执行,由于只有一个线程,所以任务只能够一个一个的执行
// 同事我们还可以看到,所有任务都在打印的 syncConCurrent -- begin 和syncConCurrent -- end 之间.说明任务是先添加到队列中马上执行

@end
