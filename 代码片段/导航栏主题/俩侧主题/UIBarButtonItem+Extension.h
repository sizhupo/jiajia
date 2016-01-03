//
//  UIBarButtonItem+Extension.h
//  青云微博
//
//  Created by qingyun on 15/12/2.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

//设置导航栏的左右图标方法（外加事件监听）
+ (UIBarButtonItem *)ItemWithimageName:(NSString *)imageName HighlightedName:(NSString *)HighlightedName Target:(id)target action:(SEL)action;


@end
