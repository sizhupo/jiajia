
//
//  QYResultTableViewController.m
//  微信
//
//  Created by 青云-wjl on 15/9/22.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYResultTableViewController.h"
#import "QYTableViewCell.h"
@interface QYResultTableViewController ()
@property (nonatomic, strong)NSArray *results;
@end

@implementation QYResultTableViewController

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    //搜索条件,在searchBar上
    NSString *filterStr = searchController.searchBar.text;
    // 如果filteredStr为nil，或者为空字符串@""
    if (!filterStr || filterStr.length == 0) {
        _results = _array;
    } else {
//        //SELF为团购的Model
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.title CONTAINS[cd] %@", filterStr];
        _results = [_array filteredArrayUsingPredicate:predicate];
    }
    
    [self.tableView reloadData];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 116;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _results.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *identify = @"cell";
    
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"QYTableViewCell" owner:self options:nil].firstObject;
    }
    
    // 配置cell
    QYTGModel *model = _results[indexPath.row];
    
    cell.model = model;
    
    return cell;
}




@end
