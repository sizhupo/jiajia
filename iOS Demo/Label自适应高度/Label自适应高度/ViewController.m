//
//  ViewController.m
//  Label自适应高度
//
//  Created by  syc on 16/4/22.
//  Copyright © 2016年 HK. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSString *str = @"我是一个下坡玩家,坑看产品；就爱端口即可卡卡的看说的； 【OK就撒旦v双排扣的排水口的看皮卡剧打开";
    [self AutoHeightWithLabelText:str];
}

- (UILabel *)AutoHeightWithLabelText:(NSString *)LabelText
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
    [label setNumberOfLines:0];
    label.backgroundColor = [UIColor lightGrayColor];
    NSString *DataSource = LabelText;
    UIFont *font = [UIFont boldSystemFontOfSize:18];
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width,2000);
    CGSize labelsize = [DataSource sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    
    [label setFrame:CGRectMake(8, 64, [UIScreen mainScreen].bounds.size.width - 16, labelsize.height)];
    label.text = DataSource;
    label.textColor = [UIColor greenColor];
    [self.view addSubview:label];
    
    return label;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
