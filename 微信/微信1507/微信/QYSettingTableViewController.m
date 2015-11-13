//
//  QYSettingTableViewController.m
//  微信
//
//  Created by 青云-wjl on 15/9/22.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYSettingTableViewController.h"
#import "QYAlbumViewController.h"
@interface QYSettingTableViewController ()

@end

@implementation QYSettingTableViewController

-(void)awakeFromNib
{
    self.tabBarController.tabBar.tintColor = [UIColor brownColor];
    //self.tabBarController.tabBar.backgroundImage
    //self.tabBarController.tabBar.barTintColor = [UIColor brownColor];
    UIImage *image = [[UIImage imageNamed:@"tabbar_me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:@"tabbar_meHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:image selectedImage:selectedImage];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航条不透明
    self.navigationController.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }else if (section == 1){
        return 1;
    }
    return 1;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 0) {
        QYAlbumViewController *albumVC = [[QYAlbumViewController alloc] init];
        [self.navigationController pushViewController:albumVC animated:YES];
    }
}

@end
