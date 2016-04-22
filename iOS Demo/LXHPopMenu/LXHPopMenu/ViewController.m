//
//  ViewController.m
//  LXHPopMenu
//
//  Created by  syc on 16/4/19.
//  Copyright © 2016年 HK. All rights reserved.
//

#import "ViewController.h"
#import "LHBottomPickerView.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 100, 100, 80);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.btn = btn;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)btnClick
{
    [LHBottomPickerView showEditPickerViewWithController:self andData:@[@"早上",@"中午",@"下午"] andBlock:^(NSString *temp) {
        [self.btn setTitle:temp forState:UIControlStateNormal];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
