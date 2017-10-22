//
//  ViewController.m
//  图文混排
//
//  Created by 高级iOS开发 on 2017/10/22.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // attachMent - 附件
    NSTextAttachment * attachment = [[NSTextAttachment alloc]init];
    
    attachment.image = [UIImage imageNamed:@"compose_emoticonbutton_background_highlighted"];
    
    // 提示lineheight 大致和字体的大小相等
    CGFloat height = self.label.font.lineHeight;
    attachment.bounds = CGRectMake(0, -4, height, height);
    
    // 图像字符串
    NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:attachment];
    
    // 3定义一个可变的属性字符串
    NSMutableAttributedString * attrstrM = [[NSMutableAttributedString alloc]initWithString:@"我jkhjkhhjg"];
    
    // 修改富文本中的不同文字的样式
    [attrstrM addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 5)];
    [attrstrM addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 5)];
    
   
  
    [attrstrM appendAttributedString:imageStr];
    
    NSAttributedString * text = [[NSAttributedString alloc]initWithString:@"123"];
    
    [attrstrM appendAttributedString:text];
    // 设置属性文本
    self.label.attributedText = attrstrM;
}


@end
