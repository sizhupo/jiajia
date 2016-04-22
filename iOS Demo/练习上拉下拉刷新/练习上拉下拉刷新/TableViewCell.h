//
//  TableViewCell.h
//  练习上拉下拉刷新
//
//  Created by  syc on 16/4/22.
//  Copyright © 2016年 HK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Model;

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UILabel *text1;
@property (weak, nonatomic) IBOutlet UILabel *text2;

@property (nonatomic, strong) Model *model;

@end
