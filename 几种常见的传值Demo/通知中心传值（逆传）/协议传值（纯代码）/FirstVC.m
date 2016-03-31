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
    
    //2.给firstVC添加一个下一个按钮和注销按钮
    [self  addNextButtonAndCancelBtn];
    
   //3.注册一个通知（addObserver：通知的响应者，name：当前通知的名字，object：通知的发送者）
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeNextLabelValue:) name:@"ChangeLabelValue" object:nil];
}

//通知的方法
- (void)ChangeNextLabelValue:(NSNotification *)Notification
{
    NSLog(@"%@",Notification);
    NSDictionary *dic = Notification.userInfo;
    self.Label.text = dic[@"value"];
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
- (void)addNextButtonAndCancelBtn
{
    //下一个按钮
    UIButton *NextButton = [[UIButton alloc] init];
    NextButton.frame = CGRectMake(KScreenW * 0.36, KScreenH * 0.7, KScreenW * 0.25, KScreenH * 0.08);
    NextButton.backgroundColor = [UIColor greenColor];
    [NextButton setTitle:@"下一页" forState:UIControlStateNormal];
    [NextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [NextButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    NextButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    
    [NextButton addTarget:self action:@selector(NextPages:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:NextButton];
    
    //取消按钮
    UIButton *CancelButton = [[UIButton alloc] init];
    CancelButton.frame = CGRectMake(KScreenW * 0.36, KScreenH * 0.6, KScreenW * 0.25, KScreenH * 0.08);
    CancelButton.backgroundColor = [UIColor greenColor];
    [CancelButton setTitle:@"注销通知" forState:UIControlStateNormal];
    [CancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [CancelButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    CancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    
    [CancelButton addTarget:self action:@selector(CancelPages) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:CancelButton];
}


#pragma mark - 公共方法
- (void)NextPages:(UIButton *)Button
{
    SecondVC *SecondViewController = [[SecondVC alloc] init];
    
    SecondViewController.view.backgroundColor = [UIColor orangeColor];
    
    [self presentViewController:SecondViewController animated:YES completion:nil];
    
}

//销毁通知
- (void)CancelPages
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ChangeLabelValue" object:nil];
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
