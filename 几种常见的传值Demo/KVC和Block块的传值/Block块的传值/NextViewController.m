//
//  NextViewController.m
//  Block块的传值
//
//  Created by  syc on 16/3/29.
//  Copyright © 2016年 YS. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic, strong) NSString *text;

//定义一个当亲控制器的block块的属性
@property (nonatomic, strong) void(^changeLabelValue)(NSString * textFieldLabel);

@end

@implementation NextViewController

- (IBAction)back:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (_changeLabelValue) {
        _changeLabelValue(self.textField.text);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textField.text = self.text;

    // Do any additional setup after loading the view.
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
