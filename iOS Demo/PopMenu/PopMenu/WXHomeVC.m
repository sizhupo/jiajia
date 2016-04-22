//
//  WXHomeVC.m
//  PopMenu
//
//  Created by  syc on 16/4/16.
//  Copyright © 2016年 HK. All rights reserved.
//

#import "WXHomeVC.h"
#import "WXPopMenu.h"
#import "UIView+Extension.h"
#import "WXScore.h"

@interface WXHomeVC ()<WXPopMenuDelegate>

@property (nonatomic, strong) WXPopMenu *Menu;

@property (nonatomic, strong) UIButton *btn;



@end

@implementation WXHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加一个按钮用来点击弹出菜单
    [self addOneBtn];
    
}

- (void)addOneBtn
{
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [Btn setTitle:@"点我弹出菜单" forState:UIControlStateNormal];
    Btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [Btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [Btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [Btn setBackgroundColor:[UIColor grayColor]];
    Btn.frame = CGRectMake(100, 300, 160, 80);
    [self.view addSubview:Btn];
    
    self.btn = Btn;
    [Btn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - priviate

- (void)BtnClick
{
    UIView *MenuView = [[UIView alloc] init];
    MenuView.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, ([UIScreen mainScreen].bounds.size.height) / 3);
    
    self.MenuView = MenuView;
    MenuView.backgroundColor = [UIColor lightGrayColor];
    
    
    UIButton *Btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn1.frame = CGRectMake(10, 10, 40, 20);
    Btn1.backgroundColor = [UIColor grayColor];
    [Btn1 setTitle:@"取消" forState:UIControlStateNormal];
    [Btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [Btn1 setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [Btn1 addTarget:self action:@selector(Cancel) forControlEvents:UIControlEventTouchUpInside];
    [MenuView addSubview:Btn1];
    
    WXScore *ScoreView = [[WXScore alloc] initWithFrame:CGRectMake(20, 40, 375, 40)];
    ScoreView.LeftMargin = 10;
    ScoreView.Max_star = 5;
    ScoreView.isSelected = YES;
    ScoreView.Show_score = 5;
    ScoreView.Space = 10;
    ScoreView.normalImage = [UIImage imageNamed:@"btn_star_evaluation_normal"];
    ScoreView.highlightedImage = [UIImage imageNamed:@"btn_star_evaluation_press"];
    [MenuView addSubview:ScoreView];
    
    UIButton *Btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn2.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 60, 10, 40, 20);
    Btn2.backgroundColor = [UIColor grayColor];
    [Btn2 setTitle:@"确定" forState:UIControlStateNormal];
    [Btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [Btn2 setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [Btn2 addTarget:self action:@selector(Certain) forControlEvents:UIControlEventTouchUpInside];
    [MenuView addSubview:Btn2];
    
    
    WXPopMenu *menu = [[WXPopMenu alloc ] initWithContentView:MenuView];
    menu.Delegate = self;
    self.Menu = menu;
    [menu showPopMenuInRect:CGRectMake(0, ([UIScreen mainScreen].bounds.size.height) * 2/3, [UIScreen mainScreen].bounds.size.width, ([UIScreen mainScreen].bounds.size.height) / 3)];

}

- (void)Cancel
{
    //self.MenuView.hidden = YES;
    [self.MenuView removeFromSuperview];
    
    self.Menu.dimBackgroud = NO;
}
- (void)Certain
{
    
    self.Menu.dimBackgroud = NO;
   [self.MenuView removeFromSuperview];
    
    UIAlertView *AlertView = [[UIAlertView alloc] initWithTitle:@"申诉评价" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [AlertView show];
    [self.view addSubview:AlertView];
}

#pragma mark - WXPopMenuDelegate
- (void)PopMenuDidDisMissed:(WXPopMenu *)PopMenu
{
    
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
