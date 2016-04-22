//
//  TableViewCell.m
//  练习上拉下拉刷新
//
//  Created by  syc on 16/4/22.
//  Copyright © 2016年 HK. All rights reserved.
//

#import "TableViewCell.h"
#import "Model.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setModel:(Model *)model
{
    if (_model ==nil) {
        _model = model;
    }
    
    self.text.text = model.fsName;
    self.text1.text = model.fsContacts;
    self.text2.text = model.fsTopic;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
