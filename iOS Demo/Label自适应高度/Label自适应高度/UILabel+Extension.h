//
//  UILabel+Extension.h
//  HKLinkInfo
//
//  Created by houshilong on 16/4/13.
//  Copyright © 2016年 HKMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

//静态Label
+ (UILabel *)commonLabeltext:(NSString*)text font:(UIFont*)font textAlignment:(NSTextAlignment)textAlignment;

//动态Label
+(UILabel *)AutoLayoutHeightlabelWithPointX:(CGFloat)pointX pointY:(CGFloat)pointY width:(CGFloat)width strContent:(NSString *)strContent font:(UIFont *)font textAlignmeng:(NSTextAlignment)textAlignmeng;
@end
