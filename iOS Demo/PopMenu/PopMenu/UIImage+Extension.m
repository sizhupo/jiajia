//
//  UIImage+Extension.m
//  微博练习
//
//  Created by  syc on 16/3/18.
//  Copyright © 2016年 YS. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

//图片处理方法
+ (UIImage *)imageWithName:(NSString *)name
{
    UIImage *image = nil;
        NSString *newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageNamed:newName];
    
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
}

//图片的拉伸
+ (UIImage *)ResizedImage:(NSString *)name
{
    UIImage *image = [UIImage imageWithName:name];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.width * 0.5];
}


@end
