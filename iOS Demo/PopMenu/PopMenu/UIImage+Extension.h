//
//  UIImage+Extension.h
//  微博练习
//
//  Created by  syc on 16/3/18.
//  Copyright © 2016年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  加载图片
 *
 *  @param name 图片名字
 */
+ (UIImage *)imageWithName:(NSString *)name;


/**
 *  拉伸图片
 *
 *  @param name 图片名字
 */
+ (UIImage *)ResizedImage:(NSString *)name;

@end
