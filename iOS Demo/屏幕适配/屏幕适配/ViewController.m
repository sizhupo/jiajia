//
//  ViewController.m
//  屏幕适配
//
//  Created by  syc on 16/4/19.
//  Copyright © 2016年 HK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
    [self.view addSubview:tableView];
}

#pragma mark - table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        NSArray *NibName = [[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:nil options:nil];
        cell = [NibName lastObject];
            
        }
    
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
