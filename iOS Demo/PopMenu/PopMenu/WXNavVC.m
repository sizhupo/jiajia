//
//  WXNavVC.m
//  微博练习
//
//  Created by  syc on 16/3/18.
//  Copyright © 2016年 YS. All rights reserved.
//

#import "WXNavVC.h"
#import "UIImage+Extension.h"
#import "UIBarButtonItem+Extension.h"

@interface WXNavVC ()

@end

@implementation WXNavVC

/**
 *  这个方法是在视图控制器加载完毕之后调用的方法
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/**
 *  当第一次使用这个类的时候就会调用一次
 */
+ (void)initialize
{
    //设置UIBarButtonItem的主题
    [self setupBarButtonItemThme];
    
    //设置UINavigationBar的主题
    [self setupNavigationBarTheme];
}

 //设置UINavigationBar的主题
+ (void)setupNavigationBarTheme
{
    //通过appearance可以设置UIBarButtonItem的所有外表
    UINavigationBar *apperance = [UINavigationBar appearance];
   
        //设置导航栏的背景
        [apperance setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"]  forBarMetrics:UIBarMetricsDefault];
    
    //设置导航栏的文字属性
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    textAttributes[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    //UIOffsetZero:是一个结构体，必须先包装成NSValue，才能放进字典或者是数组里面
    //textAttributes[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    [apperance setTitleTextAttributes:textAttributes];

}

//设置UIBarButtonItem的主题
+ (void)setupBarButtonItemThme
{
    //通过appearance可以设置UIBarButtonItem的所有外表
    UIBarButtonItem *apperance = [UIBarButtonItem appearance];
    //普通状态的外表
    NSMutableDictionary *textAttr = [NSMutableDictionary dictionary];
    textAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [apperance setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    
    //高亮状态的外表
    NSMutableDictionary *HightextAttr = [NSMutableDictionary dictionary];
    HightextAttr[NSForegroundColorAttributeName] = [UIColor redColor];
    HightextAttr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [apperance setTitleTextAttributes:HightextAttr forState:UIControlStateHighlighted];
    
    //不可点状态的外表
    NSMutableDictionary *DisabledtextAttr = [NSMutableDictionary dictionary];
    DisabledtextAttr[NSForegroundColorAttributeName] = [UIColor grayColor];
    DisabledtextAttr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [apperance setTitleTextAttributes:DisabledtextAttr forState:UIControlStateDisabled];
    
    //设置背景
    [apperance setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

/**
 *  拦截所有push进来的控制器
 *
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        //1.设置导航栏左侧按钮的主题
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem ItemWithImageName:@"navigationbar_back" highlightedImageName:@"navigationbar_back_highlighted" target:self action:@selector(oneBack)];
        
        //2.设置导航栏右侧按钮的主题
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem ItemWithImageName:@"navigationbar_more" highlightedImageName:@"navigationbar_more_highlighted" target:self  action:@selector(oneMore)];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

//返回
- (void)oneBack
{
    [self popViewControllerAnimated:YES];
}

//更多
- (void)oneMore
{
    [self popToRootViewControllerAnimated:YES];
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
