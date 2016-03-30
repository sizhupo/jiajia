//
//  FirstViewController.m
//  Block块的传值
//
//  Created by  syc on 16/3/29.
//  Copyright © 2016年 YS. All rights reserved.
//

#import "FirstViewController.h"
#import "WXChangeLabelValue.h"
#import "NextViewController.h"

@interface FirstViewController ()<WXChangeLabelValue>

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)ChangeLabelValue:(NSString *)value
{
    self.label.text = value;
}

//获取目标视图控制器用来给他的相关的属性进行传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //
    NextViewController *Controller = segue.destinationViewController;
    [Controller setValue:self.label.text forKeyPath:@"text"];
    
    //（方法一：）把当前的视图控制器设置为下一个视图控制器的代理
    Controller.delegate = self;
    
    //（方法二：）用KVC模式将当前的试图控制器设置作为下一个视图控制器的代理
    //[Controller setValue:self forKeyPath:@"delegate"];
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
