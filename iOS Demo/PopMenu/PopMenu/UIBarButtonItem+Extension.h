//
//  UIBarButtonItem+Extension.h
//  微博练习
//
//  Created by  syc on 16/3/18.
//  Copyright © 2016年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

/**
 *  设置导航栏主题的方法
 *
 *  @param ImageName            图片名
 *  @param highlightedImageName 高亮图片名
 *  @param action               动作
 */

+ (UIBarButtonItem *)ItemWithImageName:(NSString *)ImageName highlightedImageName:(NSString *)highlightedImageName target:(id)target action:(SEL)action;

@end
