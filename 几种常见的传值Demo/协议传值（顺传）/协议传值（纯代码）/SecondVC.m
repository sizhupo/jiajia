//
//  SecondVC.m
//  协议传值（纯代码）
//
//  Created by  syc on 16/3/30.
//  Copyright © 2016年 YS. All rights reserved.
//

#import "SecondVC.h"
#import "FirstVC.h"

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

@interface SecondVC ()<ChangeLabelValueDelegate>

@property (nonatomic, strong) UITextField *TextField;

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTextFieldText];
    
    [self addBackButton];
    
}

//给firstVC添加一个TextField
- (void)addTextFieldText
{
    UITextField *TextField = [[UITextField alloc] init];
    TextField.frame = CGRectMake(20, 160, KScreenW - 40, 40);
    //TextField.text = @"今天天气不错哦！";
    TextField.textColor = [UIColor whiteColor];
    TextField.font = [UIFont boldSystemFontOfSize:17];
    TextField.backgroundColor = [UIColor redColor];
    TextField.textAlignment = NSTextAlignmentCenter;
    self.TextField = TextField;
    [self.view addSubview:TextField];
}

//给firstVC添加一个TextField
- (void)addBackButton
{
    UIButton *Button = [[UIButton alloc] init];
    Button.frame = CGRectMake(KScreenW * 0.36, KScreenH * 0.7, KScreenW * 0.25, KScreenH * 0.08);
    Button.backgroundColor = [UIColor greenColor];
    [Button setTitle:@"返回" forState:UIControlStateNormal];
    [Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    Button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    
    [Button addTarget:self action:@selector(ForwardPages:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Button];
}

#pragma mark - delegate
- (void)ChangeLabelValue:(NSString *)LabelValue
{
    self.TextField.text = LabelValue;
    
}


- (void)ForwardPages:(UIButton *)Button
{
   [self dismissViewControllerAnimated:YES completion:nil];
    
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
