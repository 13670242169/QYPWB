//
//  ViewController.m
//  OC-GCD
//
//  Created by Apple on 2017/11/9.
//  Copyright © 2017年 Apple. All rights reserved.
//
/*
1. GCD简介
2. 任务和队列
3. GCD的使用步骤
4. 队列的创建方法
5. 任务的创建方法
6. GCD的基本使用
7. 并行队列 + 同步执行
8. 并行队列 + 异步执行
9. 串行队列 + 同步执行
10. 串行队列 + 异步执行
11. 主队列 + 同步执行
12. 主队列 + 异步执行
13. GCD线程之间的通讯
14. GCD的其他方法
15. GCD的栅栏方法dispatch_barrier_async
16. GCD的延时执行方法dispatch_after
17. GCD的一次性代码(只执行一次)dispatch_once
18. GCD的快速迭代方法dispatch_apply
19. GCD的队列组dispatch_group
 */

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,strong)NSMutableArray *cls;
@end

@implementation ViewController
-(NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray arrayWithObjects:@"GCD简介",@"任务和队列",@"GCD的使用步骤",@"并行队列 + 同步执行",@"并行队列 + 异步执行",@"串行队列 + 同步执行",@"串行队列 + 异步执行",@"主队列 + 同步执行",@"主队列 + 异步执行",@"GCD线程之间的通讯",@"GCD的其他方法",@"GCD的栅栏方法dispatch_barrier_async",@"GCD的延时执行方法dispatch_after",@"GCD的一次性代码(只执行一次)dispatch_once",@"GCD的快速迭代方法dispatch_apply",@"GCD的队列组dispatch_group", nil];
    }
    return _dataSource;
}
-(NSMutableArray *)cls{
    if (_cls == nil) {
        _cls = [NSMutableArray arrayWithObjects:@"ViewController1",@"ViewController2",@"ViewController3",@"ViewController4",@"ViewController5",@"ViewController6",@"ViewController7",@"ViewController1",@"ViewController1",@"ViewController1",@"ViewController1",@"ViewController1",@"ViewController1",@"ViewController1",@"ViewController1",@"ViewController1",@"ViewController1",@"ViewController1", nil];
    }
    return  _cls;
}
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return  _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count   ;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *mycv = [[NSClassFromString(self.cls[indexPath.row]) alloc] init];
  
    [self.navigationController pushViewController:mycv animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
