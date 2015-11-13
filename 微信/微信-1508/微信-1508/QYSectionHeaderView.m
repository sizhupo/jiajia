//
//  QYSectionHeaderView.m
//  LOL
//
//  Created by qingyun on 15/10/27.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYSectionHeaderView.h"
#import "QYFriendGroup.h"
@interface QYSectionHeaderView ()
@property (nonatomic, strong) UIButton *bgBtn;
@property (nonatomic, strong) UILabel *label;
@end

@implementation QYSectionHeaderView

static NSString *headerViewIdentifier = @"headerView";
+(instancetype)headerViewWithTableView:(UITableView *)tableView
{
    QYSectionHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewIdentifier];
    if (headerView == nil) {
        headerView = [[QYSectionHeaderView alloc] initWithReuseIdentifier:headerViewIdentifier];
        
    }
    return headerView;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //1、添加背景btn
        UIButton *bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:bgBtn];
        
        //对bgBtn添加背景图片（普通、高亮）
        UIImage *image = [[UIImage imageNamed:@"buddy_header_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        UIImage *highLightedImage = [[UIImage imageNamed:@"buddy_header_bg_highlighted"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        
        [bgBtn setBackgroundImage:image forState:UIControlStateNormal];
        [bgBtn setBackgroundImage:highLightedImage forState:UIControlStateHighlighted];
        
        //设置bgBtn的字体颜色
        [bgBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //设置内容的显示
        bgBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        //设置内容的偏移量
        bgBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        //设置标题的偏移量
        bgBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        //设置btn中图片视图的内容模式
        bgBtn.imageView.contentMode = UIViewContentModeCenter;
        
        bgBtn.imageView.clipsToBounds = NO;
        //设置bgBtn的图片和标题
        [bgBtn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        
        //bgBtn添加事件监听
        [bgBtn addTarget:self action:@selector(bgBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //2、在背景btn上面添加右边的label
        UILabel *label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        
        //设置label的文本对齐方式
        label.textAlignment = NSTextAlignmentRight;
        
        _bgBtn = bgBtn;
        _label = label;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置bgBtn的frame
    _bgBtn.frame = self.bounds;
    
    //设置label的frame
    CGFloat labelW = 100;
    CGFloat labelH = self.bounds.size.height;
    CGFloat labelX = self.bounds.size.width - labelW - 10;
    CGFloat labelY = 0;
    
    _label.frame = CGRectMake(labelX, labelY, labelW, labelH);
    
}


-(void)bgBtnClick:(UIButton *)btn
{
    //1、更改当前section的打开状态
    if (_friendGroup.isOpen) {
        _friendGroup.isOpen = NO;
        
    }else{
        _friendGroup.isOpen = YES;
    }
    
    //2、刷新表视图
    if (_headerViewClick) {
        _headerViewClick();
    }
}

//重写setter方法，设置子视图属性
-(void)setFriendGroup:(QYFriendGroup *)friendGroup
{
    _friendGroup = friendGroup;
    
    //设置子视图属性
    [_bgBtn setTitle:friendGroup.name forState:UIControlStateNormal];
    _label.text = [NSString stringWithFormat:@"%ld/%lu",(long)friendGroup.online,(unsigned long)friendGroup.friends.count];
    
    
    if (!_friendGroup.isOpen) {
        _bgBtn.imageView.transform = CGAffineTransformIdentity;
    }else{
        _bgBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
}
@end
