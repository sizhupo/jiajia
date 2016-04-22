//
//  ViewController.m
//  练习上拉下拉刷新
//
//  Created by  syc on 16/4/22.
//  Copyright © 2016年 HK. All rights reserved.
//

#import "ViewController.h"
#import "LHAFNManager.h"
#import "LHRefreshTableView.h"
#import "Model.h"
#import "ProgressHUD.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,LHRefreshDelegate>
{
    NSInteger _pageSize;
    NSInteger _page;
}

//所有数据
@property (nonatomic,strong)NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LHRefreshTableView *tableView=[[LHRefreshTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-127) style:UITableViewStylePlain];
    self.tableView=tableView;
    [self.view addSubview:tableView];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.refreshDelegate=self;
    
    //一次请求只需要返回一条数据
    _pageSize = 10;
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 数组懒加载
- (NSArray *)array
{
    if (_array ==nil) {
        NSArray *array = [NSArray array];
        _array = array;
    }
    return _array;
}

//视图将要显示的时候让菊花转起来
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView refreshing];
}

#pragma mark - 上啦刷新
-(void)refreshData
{
    _page = 1;
    [self requestDataFromServer:_page];
}

#pragma mark - 加载更多
- (void)loadMoreData
{
    _page+=1;
    
    [self requestDataFromServer:_page];
}

//加载网络数据
- (void)requestDataFromServer:(NSInteger)page
{
    //1.加载url
    NSString *urlStr=@"http://192.168.6.199:8888/xxld/moble/complain/ganged/processedAppointList";
    NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:@(page),@"page",@(_pageSize),@"pagesize",@"admin",@"loginName", nil];
    [LHAFNManager GET:urlStr params:param success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *Array = responseObject;
        NSMutableArray *tempArr = [NSMutableArray array];
        
        if (_page ==1) {
        for (NSDictionary *dict in Array) {
            Model *model = [[Model alloc] initWithDict:dict];
            [tempArr addObject:model];
        }
        self.array = tempArr;
        [self.tableView reloadData];
        [self.tableView refreshNormal];
        [ProgressHUD showSuccess:@"刷新成功"];
        }else{//不是第一页
            if (Array.count == 0) {
                //显示
                [ProgressHUD showError:@"没有更多数据了"];
            }else{
                for (NSDictionary *dict in Array) {
                    Model *model = [[Model alloc] initWithDict:dict];
                    [tempArr addObject:model];
                }
                
                self.array = [self.array arrayByAddingObjectsFromArray:tempArr];
                [self.tableView reloadData];
            }
        }
        
        [self.tableView refreshNormal];
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        [self.tableView refreshNormal];
        [ProgressHUD showError:@"网络请求失败"];
    }];
}

#pragma mark - table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MTCell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:nil options:nil];
        cell = [nibs lastObject];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    cell.model = self.array[indexPath.row];
    
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}
#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
