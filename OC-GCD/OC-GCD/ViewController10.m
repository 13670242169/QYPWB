//
//  ViewController10.m
//  OC-GCD
//
//  Created by Apple on 2017/11/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController10.h"

@interface ViewController10 ()

@end

@implementation ViewController10

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     在iOS开发过程中，我们一般在主线程里边进行UI刷新，例如：点击、滚动、拖拽等事件。我们通常把一些耗时的操作放在其他线程，比如说图片下载、文件上传等耗时操作。而当我们有时候在其他线程完成了耗时操作时，需要回到主线程，那么就用到了线程之间的通讯。
     */

    //    PRIORITY  :优先级
    //    DEFAULT :默认


//    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)  系统给我们创建一个全局队列

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 200; ++i) {
            NSLog(@"1------%@",[NSThread currentThread]);
        }
        // 回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"2-------%@",[NSThread currentThread]);
        });

    });

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
@end
