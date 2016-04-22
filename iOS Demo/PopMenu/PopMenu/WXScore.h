//
//  WXScore.h
//  PopMenu
//
//  Created by  syc on 16/4/16.
//  Copyright © 2016年 HK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXScore : UIView

/** 展示的星数 */
@property (nonatomic, assign) NSInteger Show_star;
/** 展示的分数*/
@property (nonatomic, assign) CGFloat Show_score;
/** 星星之间的间隔 */
@property (nonatomic, assign) CGFloat Space;


/** 星星距离左边的间距 */
@property (nonatomic, assign)  CGFloat LeftMargin;
/** 最多的星数，默认为5 */
@property (nonatomic, assign)  NSInteger Max_star;
/** 是否支持选择星数 */
@property (nonatomic, assign)  BOOL isSelected;
/** 正常状态下的图片*/
@property (nonatomic, strong)  UIImage *normalImage;
/** 选中状态下的图片*/
@property (nonatomic, strong)  UIImage *highlightedImage;

@end
