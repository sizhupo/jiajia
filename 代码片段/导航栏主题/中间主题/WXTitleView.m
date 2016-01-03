//
//  WXTitleView.m
//  网易新闻UI界面
//
//  Created by qingyun on 16/1/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "WXTitleView.h"

@implementation WXTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        [self setImage:[UIImage imageNamed:@"navbar_netease"] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:23];
        self .titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
        
    }
    return self;
}

//根据文字的尺寸来计算TitleView的尺寸
- (void)setTitle:(NSString *)title
{
    _title = [title copy];

    [self setTitle:title forState:UIControlStateNormal];
    
    NSDictionary *attributes  =@{NSFontAttributeName:self.titleLabel.font};
    CGFloat titleW = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
    
    self.height = self.currentImage.size.height;
    self.width = titleW + self.currentImage.size.width + self.titleEdgeInsets.left;
}
@end
