//
//  QYSectionHeaderView.h
//  LOL
//
//  Created by qingyun on 15/10/27.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYFriendGroup;
@interface QYSectionHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong)QYFriendGroup *friendGroup;

@property (nonatomic, strong) void (^headerViewClick)(void);

+(instancetype)headerViewWithTableView:(UITableView *)tableView;

@end
