//
//  UIImage+Extension.m
//  青云微博
//
//  Created by qingyun on 15/12/2.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "UIImage+Extension.h"
#import "Common.h"

@implementation UIImage (Extension)

+ (UIImage *)imageWithName:(NSString *)name
{
#if 0//方法1
    UIImage *image = nil;
    if (ios7) {
        NSString *newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageNamed:newName];
        if (image ==nil) {
            image = [UIImage imageNamed:name];
        }
    }else{
        image = [UIImage imageNamed:name];
    }
    return image;
#endif
    //方法2
    UIImage *image = nil;
    if (ios7) {//处理ios7的情况
        NSString *newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageNamed:newName];
    }
    if (image==nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
    
}
/**
 * 图片的拉伸
 */
+ (UIImage *)ResizedimageWithName:(NSString *)name
{
    UIImage *image = [UIImage imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}



@end
