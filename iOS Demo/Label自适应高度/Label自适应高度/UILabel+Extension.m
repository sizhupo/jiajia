//
//  UILabel+Extension.m
//  HKLinkInfo
//
//  Created by houshilong on 16/4/13.
//  Copyright © 2016年 HKMac. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

+(UILabel *)commonLabeltext:(NSString *)text font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = font;
    label.textAlignment = textAlignment;
    
    return label;
}

+(UILabel *)AutolayoutHeightlabelWithPointX:(CGFloat)pointX pointY:(CGFloat)pointY width:(CGFloat)width strContent:(NSString *)strContent font:(UIFont *)font textAlignmeng:(NSTextAlignment)textAlignmeng
{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [strContent boundingRectWithSize:CGSizeMake(width,MAXFLOAT)
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:attributes
                                                context:nil].size;
    
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(pointX, pointY, width, labelSize.height)];
    [myLabel setNumberOfLines:0];
    myLabel.text = strContent;
    myLabel.font = font;
 
    return myLabel;
}
@end


