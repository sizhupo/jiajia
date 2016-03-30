//
//  FirstVC.m
//  协议传值（纯代码）
//
//  Created by  syc on 16/3/30.
//  Copyright © 2016年 YS. All rights reserved.
//

#import "FirstVC.h"
#import "SecondVC.h"

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

@interface FirstVC ()
@property (nonatomic, strong) UILabel *Label;


@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.设置控制器的背景色
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //2.给firstVC添加一个Label
    [self  addLabelText];
    
    //2.给firstVC添加一个按钮
    [self  addOneButton];
}

//给firstVC添加一个Label
- (void)addLabelText
{
    UILabel *Label = [[UILabel alloc] init];
    Label.frame = CGRectMake(20, 160, KScreenW - 40, 40);
    Label.text = @"今天天气不错哦！";
    Label.textColor = [UIColor blackColor];
    Label.font = [UIFont boldSystemFontOfSize:17];
    Label.backgroundColor = [UIColor greenColor];
    Label.textAlignment = NSTextAlignmentCenter;
    self.Label = Label;
    [self.view addSubview:Label];
}

//给firstVC添加一个TextField
- (void)addOneButton
{
    UIButton *Button = [[UIButton alloc] init];
    Button.frame = CGRectMake(KScreenW * 0.36, KScreenH * 0.7, KScreenW * 0.25, KScreenH * 0.08);
    Button.backgroundColor = [UIColor greenColor];
    [Button setTitle:@"下一页" forState:UIControlStateNormal];
    [Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    Button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    
    [Button addTarget:self action:@selector(NextPages:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Button];
}


#pragma mark - 公共方法
- (void)NextPages:(UIButton *)Button
{
    SecondVC *SecondViewController = [[SecondVC alloc] init];
    
    SecondViewController.view.backgroundColor = [UIColor orangeColor];
    
    self.delegate = SecondViewController;
    [self presentViewController:SecondViewController animated:YES completion:nil];
    
    if ([self.delegate respondsToSelector:@selector(ChangeLabelValue:)]) {
        [self.delegate ChangeLabelValue:self.Label.text];
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
