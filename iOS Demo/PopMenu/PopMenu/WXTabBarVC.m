//
//  WXTabBarVC.m
//  微博练习
//
//  Created by  syc on 16/3/18.
//  Copyright © 2016年 YS. All rights reserved.
//

#import "WXTabBarVC.h"
#import "WXHomeVC.h"
#import "WXNavVC.h"

@interface WXTabBarVC ()

@end

@implementation WXTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.添加首页控制器
     WXHomeVC *HomeVC = [[WXHomeVC alloc] init];
    HomeVC.view.backgroundColor = [UIColor whiteColor];
    [self addOneChildVC:HomeVC imageName:@"tabbar_home" SelectedImageName:@"tabbar_home_selected" title:@"首页"];
}

/**
 *  添加一个自控制器
 *
 *  @param childVC       子控制器的对象
 *  @param image         图片
 *  @param SelectedImage 选中的图片
 *  @param title         标题
 */
- (void)addOneChildVC:(UIViewController *)childVC imageName:(NSString *)imageName SelectedImageName:(NSString *)SelectedImageName title:(NSString *)title
{
    //childVC.view.backgroundColor = WXColor;
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage *SelectedImage = [UIImage imageNamed:SelectedImageName];
    
        SelectedImage = [SelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = SelectedImage;
    childVC.title = title;//同时设置了导航控制器和TabBar控制器的标题
    WXNavVC *NavVC = [[WXNavVC alloc] initWithRootViewController:childVC];
    //添加TabBar的子控制器
    [self addChildViewController:NavVC];
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
