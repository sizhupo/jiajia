//
//  UIImage+Extension.h
//  青云微博
//
//  Created by qingyun on 15/12/2.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

//加载图片的方法（适配6和7的情况）
+ (UIImage *)imageWithName:(NSString *)name;

/**
 * 图片的拉伸
 */
+ (UIImage *)ResizedimageWithName:(NSString *)name;

@end
