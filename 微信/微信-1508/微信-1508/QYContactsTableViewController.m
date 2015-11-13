//
//  QYContactsTableViewController.m
//  微信-1508
//
//  Created by qingyun on 15/11/3.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYContactsTableViewController.h"
#import "QYFriendGroup.h"
#import "QYFriend.h"
#import "QYSectionHeaderView.h"
@interface QYContactsTableViewController ()
@property (nonatomic, strong) NSArray *groups;
@end

@implementation QYContactsTableViewController
static NSString *identifier = @"cell";
//懒加载
-(NSArray *)groups
{
    if (_groups == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"hero" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *groupModels = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYFriendGroup *friendGroup = [QYFriendGroup friendGroupWithDictionary:dict];
            [groupModels addObject:friendGroup];
        }
        _groups = groupModels;
    }
    return _groups;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addRightBarBtnItem];
}

-(void)addRightBarBtnItem
{
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edit:)];
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
}
-(void)edit:(UIBarButtonItem *)barItem
{
    if ([barItem.title isEqualToString:@"编辑"]) {
        barItem.title = @"完成";
        [self.tableView setEditing:YES animated:YES];
    }else{
        barItem.title = @"编辑";
        [self.tableView setEditing:NO animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}
//每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    QYFriendGroup *friendGroup = self.groups[section];
    if (friendGroup.isOpen) {
        return friendGroup.friends.count;
    }
    return 0;
}
//每行单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    QYFriendGroup *friendGroup = self.groups[indexPath.section];
    
    QYFriend *friend = friendGroup.friends[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:friend.icon];
    cell.textLabel.text = friend.name;
    cell.detailTextLabel.text = friend.intro;
    
    cell.textLabel.textColor = friend.vip ? [UIColor redColor] : [UIColor blackColor];
    
    return cell;
}

//设置sectionHeaderView高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

#if 0
//section的头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    QYFriendGroup *friendGroup = self.groups[section];
    return friendGroup.name;
}
#endif

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //创建sectionHeaderView（已经复用）
    QYSectionHeaderView *sectionHeaderView = [QYSectionHeaderView headerViewWithTableView:tableView];
    //取出当前section对应的数据模型QYFriendGroup
    QYFriendGroup *fg = self.groups[section];
    sectionHeaderView.friendGroup = fg;
    
    sectionHeaderView.headerViewClick = ^(){
        [tableView reloadData];
    };
    
    return sectionHeaderView;
}

#pragma mark -删除
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        QYFriendGroup *friendGroup = self.groups[indexPath.section];
        [friendGroup.friends removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

#pragma mark -移动

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    QYFriendGroup *fromGroup = self.groups[fromIndexPath.section];
    
    QYFriend *friend = fromGroup.friends[fromIndexPath.row];
    
    [fromGroup.friends removeObjectAtIndex:fromIndexPath.row];
    
    QYFriendGroup *toGroup = self.groups[toIndexPath.section];
    
    [toGroup.friends insertObject:friend atIndex:toIndexPath.row];
    
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
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
