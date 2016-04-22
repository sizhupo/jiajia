//
//  WXPopMenu.h
//  PopMenu
//
//  Created by  syc on 16/4/16.
//  Copyright © 2016年 HK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    WXPopMenuArrowPositionCenter = 0,
    WXPopMenuArrowPositionLeft = 1,
    WXPopMenuArrowPositionRight = 2,
} HMPopMenuArrowPosition;

@class WXPopMenu;

@protocol WXPopMenuDelegate <NSObject>

@optional

- (void)PopMenuDidDisMissed:(WXPopMenu *)PopMenu;

@end

@interface WXPopMenu : UIView
/**
 *  代理
 */
@property (nonatomic, weak) id <WXPopMenuDelegate> Delegate;
/**
 *  蒙版效果
 */
@property (nonatomic, assign,getter=isdimBackgroud) BOOL dimBackgroud;

/**
 * 箭头方向
 */
@property (nonatomic, assign) HMPopMenuArrowPosition ArrowPosition;

/**
 *  初始化方法
 *  @param PopMenuView 弹出菜单视图
 */
- (instancetype)initWithContentView:(UIView *)PopMenuView;
+ (instancetype)PopMenuWithContentView:(UIView *)PopMenuView;

/**
 *  设置菜单的背景图片
 */
- (void)setBackgroundImage:(UIImage *)backgroundImage;

/**
 *  显示菜单
 */

- (void)showPopMenuInRect:(CGRect)rect;

/**
 *  隐藏菜单
 */

- (void)dissMiss;

@end
