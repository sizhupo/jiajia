//
//  ViewController.m
//  分页加载
//
//  Created by  syc on 16/4/21.
//  Copyright © 2016年 HK. All rights reserved.
//

#import "ViewController.h"
#import "LHRefreshTableView.h"
#import "LHAFNManager.h"

@interface ViewController ()<LHRefreshDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSInteger _pagesize;
    
    NSInteger _page;
}

/**说所有数据*/
@property (nonatomic, strong) NSArray *Array;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //直接加载当前页
    _pagesize = 1;
    
    //添加tableVoew
    LHRefreshTableView *tableView = [[LHRefreshTableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.refreshDelegate =self;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    //分页加载（一次网络请求只加载一页）
    //[self loadPages:1];
    
}


//视图将要显示的时候刷新页面，并设置当前显示页为1
- (void)viewWillAppear:(BOOL)animated
{
    _page = 1;
    [self.tableView refreshing];
}

- (void)loadPages:(NSInteger)pages
{
    NSString *url = [NSString stringWithFormat:@"http://192.168.6.199:8888/xxld/moble/policy/checkPolicys?pagesize=%ld&page=%ld",_pagesize,_page];
    
    NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:@(_pagesize),@"pagesize",@(pages),@"page" ,nil];
    
    [LHAFNManager GET:url params:param success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSArray *tempArr = responseObject;
        if (_page ==1) {
            self.Array = tempArr;
        }else{
            self.Array = [self.Array arrayByAddingObjectsFromArray:tempArr];
        }
        [self.tableView refreshNormal];
         NSLog(@"%ld",self.Array.count);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - LHRefreshTableView
- (void)refreshData
{
    _page = 1;
    [self loadPages:_page];
}

- (void)loadMoreData
{
    _page =_page +1;
    [self loadPages:_page];
}

#pragma mark - table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.Array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MTCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld", (long)indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
