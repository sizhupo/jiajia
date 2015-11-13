//
//  QYTGTableViewController.m
//  微信
//
//  Created by 青云-wjl on 15/9/22.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYTGTableViewController.h"
#import "QYTGModel.h"
#import "QYTGTableViewCell.h"

#import "QYWebViewController.h"
#import "QYResultTableViewController.h"
@interface QYTGTableViewController ()

@property (nonatomic, strong) NSMutableArray *tgModels;

@property (nonatomic, strong) UISearchController *searchController;
@end

@implementation QYTGTableViewController
#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define TableViewHeaderImageNum 3

- (IBAction)search:(UIBarButtonItem *)sender {
    [self presentViewController:_searchController animated:YES completion:nil];
}

- (void)edit:(UIBarButtonItem *)sender {
    
    if ([sender.title isEqualToString:@"编辑"]) {
        sender.title = @"完成";
        [self.tableView setEditing:YES animated:YES];
    } else {
        sender.title = @"编辑";
        [self.tableView setEditing:NO animated:YES];
    }
}


//从storyBoard初始化视图控制器
-(void)awakeFromNib
{
    [super awakeFromNib];
    
    //self.tabBarController.tabBar.tintColor = [UIColor brownColor];
    
    UIImage *image = [[UIImage imageNamed:@"tabbar_mainframe"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:@"tabbar_mainframeHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"团购" image:image selectedImage:selectedImage];
}
//懒加载tableView的数据源
- (NSMutableArray *)tgModels
{
    if (_tgModels == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
        NSArray *models = [NSArray arrayWithContentsOfFile:path];
        _tgModels = [NSMutableArray array];
        for (NSDictionary *dict in models) {
            QYTGModel *model = [QYTGModel tgModelWithDcitionary:dict];
            [_tgModels addObject:model];
        }
    }
    return _tgModels;
}

-(void)setLeftBarButtonItem
{
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edit:)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftBarButtonItem];
    [self addSubViewsForTableView];
    
}

-(void)addSubViewsForTableView
{
    //添加表格头视图
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, QYScreenW, 100)];
    //上下没移动contentSize的y可设置为0
    scrollView.contentSize = CGSizeMake(QYScreenW * TableViewHeaderImageNum, 0);
    scrollView.pagingEnabled = YES;
    for (int i = 0; i < TableViewHeaderImageNum; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(QYScreenW * i, 0, QYScreenW, 100)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%d",i + 1]];
        [scrollView addSubview:imageView];
    }
    
    scrollView.backgroundColor = [UIColor redColor];
    
    self.tableView.tableHeaderView = scrollView;

    
    //添加下拉刷新
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    [self.tableView addSubview:refresh];
    [refresh addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    
    //添加搜索视图控制器
    QYResultTableViewController *resultVC = [[QYResultTableViewController alloc] init];
    resultVC.array = self.tgModels;
    _searchController = [[UISearchController alloc] initWithSearchResultsController:resultVC];
    _searchController.hidesNavigationBarDuringPresentation = YES;
    _searchController.dimsBackgroundDuringPresentation = YES;
    //sou suo jie gou
    _searchController.searchResultsUpdater = resultVC;
    
}
//下拉刷新
-(void)refresh:(UIRefreshControl *)refresh
{
    [refresh performSelector:@selector(endRefreshing) withObject:nil afterDelay:2];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tgModels.count;;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QYTGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QYTgCell" forIndexPath:indexPath];
    
    // 配置cell
    QYTGModel *model = self.tgModels[indexPath.row];
    
    cell.tgModel = model;
    
    return cell;
}


#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.navigationController.tabBarController setHidesBottomBarWhenPushed:YES];
    QYWebViewController *webVC = [[QYWebViewController alloc] init];
    webVC.urlString = @"http://www.apple.com";
    
    [self.navigationController pushViewController:webVC animated:YES];
    
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [_tgModels removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    //取出当前选中的的单元格对应的数据模型
    QYTGModel *model = (QYTGModel *)_tgModels[fromIndexPath.row];
    //把当前的数据模型从数据源（fromIndexPath.section）中删除
    [_tgModels removeObjectAtIndex:fromIndexPath.row];
    //把当前的数据模型插入到数据源（toIndexPath.section）中
    [_tgModels insertObject:model atIndex:toIndexPath.row];
    
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    if (indexPath.section == 0 && indexPath.row == 0) {
        return NO;
    }
    
    return YES;
}


@end
