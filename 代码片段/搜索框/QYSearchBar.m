//
//  QYSearchBar.m
//  青云微博
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYSearchBar.h"
#import "Common.h"

@implementation QYSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame]) {
        
        // 设置背景
        self.background = [UIImage ResizedimageWithName:@"searchbar_textfield_background"];
        
        // 设置内容 -- 垂直居中
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        // 设置左边显示一个放大镜
        UIImageView *leftView = [[UIImageView alloc] init];
        leftView.image = [UIImage imageWithName:@"searchbar_textfield_search_icon"];
        leftView.width = leftView.image.size.width +13;
        leftView.height = leftView.image.size.height;
        // 设置leftView的内容居中
        leftView.contentMode = UIViewContentModeCenter;
        self.leftView = leftView;
        
        // 设置左边的view永远显示
        self.leftViewMode = UITextFieldViewModeAlways;
        
        // 设置右边永远显示清除按钮
        self.clearButtonMode = UITextFieldViewModeAlways;

    }
    
    return self;
}

+ (instancetype)SearchBar
{
    return [[self alloc] init];
}
@end
