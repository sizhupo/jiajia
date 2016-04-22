//
//  ViewController.m
//  FiveStar
//
//  Created by  syc on 16/4/16.
//  Copyright © 2016年 HK. All rights reserved.
//

#import "ViewController.h"
#import "LDXScore.h"

@interface ViewController ()

@property (nonatomic, strong) LDXScore *MenuView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LDXScore *MenuView = [[LDXScore alloc] initWithFrame:CGRectMake(50, 100, 300, 50)];
    
    MenuView.backgroundColor = [UIColor greenColor];
    
    MenuView.padding = 0;
    MenuView.max_star = 5;
    MenuView.isSelect = YES;
    MenuView.show_score = 5;
    MenuView.space = 10;
    MenuView.normalImg = [UIImage imageNamed:@"btn_star_evaluation_normal"];
    MenuView.highlightImg = [UIImage imageNamed:@"btn_star_evaluation_press"];
    
    [self.view addSubview:MenuView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
