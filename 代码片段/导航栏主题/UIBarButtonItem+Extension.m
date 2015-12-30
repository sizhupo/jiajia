//
//  UIBarButtonItem+Extension.m
//  青云微博
//
//  Created by qingyun on 15/12/2.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "Common.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)ItemWithimageName:(NSString *)imageName HighlightedName:(NSString *)HighlightedName Target:(id)target action:(SEL)action
{
    //导航栏
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:HighlightedName] forState:UIControlStateHighlighted];
    //尺寸
    button.size = button.currentBackgroundImage.size;
    //给导航栏的lefItem添加事件监听
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
