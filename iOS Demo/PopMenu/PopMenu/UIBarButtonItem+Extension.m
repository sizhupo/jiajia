//
//  UIBarButtonItem+Extension.m
//  微博练习
//
//  Created by  syc on 16/3/18.
//  Copyright © 2016年 YS. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIImage+Extension.h"
#import "UIView+Extension.h"

@implementation UIBarButtonItem (Extension)

/**
 *  设置导航栏主题的方法
 *
 *  @param ImageName            图片名
 *  @param highlightedImageName 高亮图片名
 *  @param action               动作
 */
+ (UIBarButtonItem *)ItemWithImageName:(NSString *)ImageName highlightedImageName:(NSString *)highlightedImageName target:(id)target action:(SEL)action
{
    //1.设置导航栏的按钮
    UIButton *Btn = [[UIButton alloc] init];
    [Btn setBackgroundImage:[UIImage imageWithName:ImageName] forState:UIControlStateNormal];
    [Btn setBackgroundImage:[UIImage imageWithName:highlightedImageName] forState:UIControlStateHighlighted];
    //2.设置按钮的尺寸为当前背景图片的尺寸
    Btn.size = Btn.currentBackgroundImage.size;
    //3.监听按钮的点击
    [Btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:Btn];
}


@end
