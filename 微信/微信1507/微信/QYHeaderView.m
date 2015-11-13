//
//  QYHeaderView.m
//  03-QQ好友
//
//  Created by 青云-wjl on 15/9/16.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYHeaderView.h"
#import "QYFriendGroup.h"
@interface QYHeaderView ()
@property (nonatomic, strong) UIButton *bgBtn;
@property (nonatomic, strong) UILabel *onlineLabel;
@end

@implementation QYHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *headerViewIdentify = @"headerView";
    QYHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewIdentify];
    if (headerView == nil) {
        headerView = [[self alloc] initWithReuseIdentifier:headerViewIdentify];
        //headerView.contentView.backgroundColor = [UIColor redColor];
    }
    return headerView;
}

//需要自定义内容，所以需要重写初始化方法
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        //设置背景为btn
        UIButton *bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:bgButton];
        
        UIImage *image = [[UIImage imageNamed:@"buddy_header_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 1, 44, 0) resizingMode:UIImageResizingModeStretch];
        
        UIImage *hightedImage = [[UIImage imageNamed:@"buddy_header_bg_highlighted"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 1, 44, 0) resizingMode:UIImageResizingModeStretch];
        [bgButton setBackgroundImage:image forState:UIControlStateNormal];
        [bgButton setBackgroundImage:hightedImage forState:UIControlStateHighlighted];
        
        // 设置内容水平方向居左显示
        bgButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

        // 设置整体内容的内部偏移
        bgButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);

        // 设置bgBtn中title的内部偏移
        bgButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);

        // 设置图片视图的内容模式
        bgButton.imageView.contentMode = UIViewContentModeCenter;
        
        bgButton.imageView.clipsToBounds = NO;
        
        [bgButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //设置三角图片
        [bgButton setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [bgButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //创建右边标签
        UILabel *label = [[UILabel alloc] init];
        [bgButton addSubview:label];
        label.textAlignment = NSTextAlignmentRight;
        
        
        _bgBtn = bgButton;
        _onlineLabel = label;
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    // ...
    _bgBtn.frame = self.bounds;
    
    CGFloat numberViewH = self.bounds.size.height;
    CGFloat numberViewW = 150;
    CGFloat numberViewX = self.bounds.size.width - numberViewW - 10;
    CGFloat numberViewY = 0;
    
    _onlineLabel.frame = CGRectMake(numberViewX, numberViewY, numberViewW, numberViewH);
}
-(void)btnClick:(UIButton *)btn
{
    if (_group.isOpen) {
        _group.isOpen = NO;
        //tableView刷新数据之后，动画失效
        //_bgBtn.imageView.transform = CGAffineTransformIdentity;
    } else {
        _group.isOpen = YES;
        //tableView刷新数据之后，动画失效
        //_bgBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    if (_headerViewClick) {
        _headerViewClick();
    }
}

-(void)setGroup:(QYFriendGroup *)group
{
    _group = group;
    
    [_bgBtn setTitle:group.name forState:UIControlStateNormal];
    
    _onlineLabel.text = [NSString stringWithFormat:@"%d/%lu",group.online,(unsigned long)group.friends.count];
    
    // 将三角形指示器进行旋转
    if ([_group isOpen]) {
        _bgBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        _bgBtn.imageView.transform = CGAffineTransformIdentity;
    }
    
}
@end
