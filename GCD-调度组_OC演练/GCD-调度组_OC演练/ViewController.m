//
//  ViewController.m
//  GCD-调度组_OC演练
//
//  Created by 高级iOS开发 on 2017/10/14.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self group2];
}

-(void)group2{
    //1 >穿建调度组
    dispatch_group_t group = dispatch_group_create();
    //2》队列
    dispatch_queue_t q = dispatch_get_global_queue(0, 0 );
    
    /// 3.调度组
    /*
     1) 调度组没有任务，直接指向notif
     2）入组多余出组，notif 永远不会指向，因为组永远不会为空
     3）出组多余入组，会奔溃
     
     --入组和出组要配对出现
     */
    // 1》入组
    dispatch_group_enter(group);
    dispatch_async(q, ^{
        NSLog(@"download A %@",[NSThread currentThread]);
        
        //2》出组
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(q, ^{
        NSLog(@"download B %@",[NSThread currentThread]);
        
        //2》出组
        dispatch_group_leave(group);
    });
    
    //4 。监听
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"come here %@",[NSThread currentThread]);
    });
}

/**
 调度组最重要的目的 - 监听 -组任务的完成   （比如多线程GCD将所有的异步请求完成以后，去监听完成了，，再去做锁需要做的事情）
 */

-(void)group1{
    //1 >穿建调度组
    dispatch_group_t group = dispatch_group_create();
    //2》队列
    dispatch_queue_t q = dispatch_get_global_queue(0, 0 );
    
    // 3.调度在监听队列调度任务
    dispatch_group_async(group, q, ^{
        NSLog(@"download A %@",[NSThread currentThread]);
    });
    dispatch_group_async(group, q, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"download B %@",[NSThread currentThread]);
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"come here %@",[NSThread currentThread]);
    });
}

@end
