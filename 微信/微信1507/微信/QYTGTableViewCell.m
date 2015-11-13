//
//  QYTGTableViewCell.m
//  微信
//
//  Created by 青云-wjl on 15/9/22.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYTGTableViewCell.h"

#import "QYTGModel.h"

@interface QYTGTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *buycount;

@end

@implementation QYTGTableViewCell


-(void)setTgModel:(QYTGModel *)tgModel
{
    _tgModel = tgModel;
    
    _imgView.image = [UIImage imageNamed:tgModel.icon];
    _title.text = tgModel.title;
    _price.text = tgModel.price;
    _buycount.text = tgModel.buycount;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
