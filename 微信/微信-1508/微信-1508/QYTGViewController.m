//
//  ViewController.m
//  微信-1508
//
//  Created by qingyun on 15/11/3.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYTGViewController.h"
#import "QYTGModel.h"
#import "QYTGTableViewCell.h"
#import "QYTGDetailViewController.h"
#import "QYTGResultTableViewController.h"
@interface QYTGViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *tgModels;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation QYTGViewController
#define QYScreenW [UIScreen mainScreen].bounds.size.width
static NSString *identifier = @"tgcell";

- (IBAction)search:(UIBarButtonItem *)sender {
    [self presentViewController:_searchController animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"团购";
    
    //注册单元格
    [_tableView registerNib:[UINib nibWithNibName:@"QYTGTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
    
    _tableView.rowHeight = 100;
    
    [self addHeaderViewForTableView];
    
    [self setLeftBarBtnItem];
    
    [self addSearchController];
    // Do any additional setup after loading the view, typically from a nib.
}

//添加搜索
-(void)addSearchController{
    QYTGResultTableViewController *tgResultVC = [[QYTGResultTableViewController alloc] initWithStyle:UITableViewStylePlain];
    tgResultVC.array = self.tgModels;
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:tgResultVC];
    _searchController.searchResultsUpdater = tgResultVC;
    _searchController.hidesNavigationBarDuringPresentation = YES;
    _searchController.dimsBackgroundDuringPresentation = YES;
}

//设置左边的UIBarBtuttonItem
-(void)setLeftBarBtnItem
{
    UIBarButtonItem *leftBarBtnItem =[[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edit:)];
    self.navigationItem.leftBarButtonItem = leftBarBtnItem;
}

-(void)edit:(UIBarButtonItem *)leftBarBtnItem
{
    if ([leftBarBtnItem.title isEqualToString:@"编辑"]) {
        leftBarBtnItem.title = @"完成";
        [_tableView setEditing:YES animated:YES];
    }else{
        leftBarBtnItem.title = @"编辑";
        _tableView.editing = NO;
    }
}

//添加tableView的头视图
-(void)addHeaderViewForTableView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, QYScreenW, 100)];
    scrollView.contentSize = CGSizeMake(QYScreenW * 3, 100);
    scrollView.pagingEnabled = YES;
    for (int i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(QYScreenW * i, 0, QYScreenW, 100)];
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d",i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        [scrollView addSubview:imageView];
    }
    _tableView.tableHeaderView = scrollView;
    
    
}

//懒加载
-(NSMutableArray *)tgModels
{
    if (_tgModels == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYTGModel *model = [QYTGModel tgModelWithDictionary:dict];
            [models addObject:model];
        }
        _tgModels = models;
    }
    return _tgModels;
}

#pragma mark -数据源
//多少组

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgModels.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QYTGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    QYTGModel *model = self.tgModels[indexPath.row];
    cell.tgModel = model;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QYTGDetailViewController *detailVC = [[QYTGDetailViewController alloc] init];
    detailVC.urlString = @"http://www.baidu.com";
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark -删除

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.tgModels removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

#pragma mark -移动

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    QYTGModel *model = self.tgModels[sourceIndexPath.row];
    
    [self.tgModels removeObjectAtIndex:sourceIndexPath.row];
    
    [self.tgModels insertObject:model atIndex:destinationIndexPath.row];
    
}

@end
