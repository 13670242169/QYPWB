//
//  ViewController.m
//  RunLoopTest
//
//  Created by Apple on 2017/10/16.
//  Copyright © 2017年 Apple. All rights reserved.
//  通过下面两个方法的比较就可以看出来,,使用了runloop以后,多线程就不会死去,,,,

#import "ViewController.h"
#import "QQThread.h"
@interface ViewController ()
@property(nonatomic,strong) QQThread *subThread;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.测试线程的销毁
    [self threadTest];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self performSelector:@selector(subThreadOpetion) onThread:self.subThread withObject:nil waitUntilDone:NO];
}

- (void)threadTest
{
    QQThread *subThread = [[QQThread alloc] initWithTarget:self selector:@selector(subThreadEntryPoint) object:nil];
    [subThread setName:@"HLThread"];
    [subThread start];
    self.subThread = subThread;
}

/**
 子线程启动后，启动runloop
 */
- (void)subThreadEntryPoint
{
    @autoreleasepool {
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        //如果注释了下面这一行，子线程中的任务并不能正常执行
        [runLoop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
        NSLog(@"启动RunLoop前--%@",runLoop.currentMode);
        [runLoop run];
    }
}

/**
 子线程任务
 */
- (void)subThreadOpetion
{
    NSLog(@"启动RunLoop后--%@",[NSRunLoop currentRunLoop].currentMode);
    NSLog(@"%@----子线程任务开始",[NSThread currentThread]);
    [NSThread sleepForTimeInterval:3.0];
    NSLog(@"%@----子线程任务结束",[NSThread currentThread]);
}

/*
///这一段代码的作用就是指出,没有使用runloop的话,多线程会销毁
- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.测试线程的销毁
    [self threadTest];
}

- (void)threadTest
{
    QQThread *subThread = [[QQThread alloc] initWithTarget:self selector:@selector(subThreadOpetion) object:nil];
    [subThread start];
}

- (void)subThreadOpetion
{
    @autoreleasepool {
        NSLog(@"%@----子线程任务开始",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"%@----子线程任务结束",[NSThread currentThread]);
    }
}
*/
@end
