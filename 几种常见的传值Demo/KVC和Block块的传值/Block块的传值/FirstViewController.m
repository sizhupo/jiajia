//
//  FirstViewController.m
//  Block块的传值
//
//  Created by  syc on 16/3/29.
//  Copyright © 2016年 YS. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

//获取目标视图控制器用来给他的相关的属性进行传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //
    UIViewController *Controller = segue.destinationViewController;
    [Controller setValue:self.label.text forKeyPath:@"text"];
    
    //将第二个视图控制器的值传给第一个视图控制器
    void(^LabelBlock)(NSString *LabelText)=^(NSString *LabelText) {
        _label.text = LabelText;
    };
    
    [Controller setValue:LabelBlock forKeyPath:@"changeLabelValue"];
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
