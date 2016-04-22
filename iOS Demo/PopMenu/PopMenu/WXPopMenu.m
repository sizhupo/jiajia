//
//  WXPopMenu.m
//  PopMenu
//
//  Created by  syc on 16/4/16.
//  Copyright © 2016年 HK. All rights reserved.
//

#import "WXPopMenu.h"
#import "UIView+Extension.h"

@interface WXPopMenu ()
/**
 *  内容视图
 */
@property (nonatomic, strong) UIView *ContentView;

/**
 *  最底部的遮盖 ：屏蔽除菜单以外控件的事件
 */
@property (nonatomic, weak) UIButton *Cover;

/**
 *  容器 ：容纳具体要显示的内容contentView
 */
@property (nonatomic, weak) UIImageView *Container;

@end

@implementation WXPopMenu

#pragma mark - 初始化方法
-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 添加一个遮盖按钮
        UIButton *cover = [[UIButton alloc] init];
        cover.backgroundColor = [UIColor clearColor];
        [cover addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
        self.Cover = cover;
        
        
        // 添加带箭头的菜单图片
        UIImageView *container = [[UIImageView alloc] init];
        container.userInteractionEnabled = YES;
        [self addSubview:container];
        self.Container = container;

        //默认箭头方向为居中
        self.ArrowPosition = WXPopMenuArrowPositionCenter;
    };
    
    return self;
    
}

/**
 *  初始化方法
 *  @param PopMenuView 弹出菜单视图
 */
- (instancetype)initWithContentView:(UIView *)PopMenuView
{
    if (self = [super init]) {
        self.ContentView = PopMenuView;
    }
    return self;
}
/**
 *  实例化方法
 *  @param PopMenuView 弹出菜单视图
 */
+ (instancetype)PopMenuWithContentView:(UIView *)PopMenuView
{
    return [[self alloc] initWithContentView:PopMenuView];
}

//布局遮盖的子视图
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.Cover.frame = self.bounds;
}

#pragma mark - 公有方法
//设置蒙版效果
- (void)setDimBackgroud:(BOOL)dimBackgroud
{
    _dimBackgroud = dimBackgroud;
    
    if (dimBackgroud) {
        self.Cover.backgroundColor = [UIColor blackColor];
        self.Cover.alpha = 0.3;
    }else{
        self.backgroundColor = [UIColor clearColor];
        self.Cover.alpha  =1.0;
    }
}

//设置箭头的方向
- (void)setArrowPosition:(HMPopMenuArrowPosition)ArrowPosition
{
#if 0
    _ArrowPosition = ArrowPosition;
    switch (ArrowPosition) {
        case WXPopMenuArrowPositionCenter:
            self.Container.image = [UIImage imageNamed:@"popover_background"];
            break;
            
        case WXPopMenuArrowPositionLeft:
            self.Container.image = [UIImage imageNamed:@"popover_background_left"];
            break;
            
        case WXPopMenuArrowPositionRight:
            self.Container.image = [UIImage imageNamed:@"popover_background_right"];
            break;
            
    }
#endif
}

//设置弹出菜单的背景图片
- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    self.Container.image = backgroundImage;
}

//设置弹出菜单的显示区域
- (void)showPopMenuInRect:(CGRect)rect
{
    //1.添加菜单整体到窗口身上
   UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    [window addSubview:self];
    
    //2.设置容器的frame
    self.Container.frame = rect;
    [self.Container addSubview:self.ContentView];
    
    //3.设置容器内部内容的frame
    CGFloat TopMargin = 12;
    CGFloat LeftMargin = 5;
    CGFloat BottomMargin = 8;
    CGFloat RightMargin = LeftMargin;
    
    self.ContentView.x = LeftMargin;
    self.ContentView.y = TopMargin;
    self.ContentView.width = self.Container.width - LeftMargin - RightMargin;
    self.ContentView.height = self.Container.height - TopMargin - BottomMargin;
}

#pragma mark - 私有方法
//遮盖点击
- (void)coverClick
{
    [self dissMiss];
}

//遮盖隐藏
- (void)dissMiss
{
    if ([self.Delegate respondsToSelector:@selector(PopMenuDidDisMissed:)]) {
        [self.Delegate PopMenuDidDisMissed:self];
    }
    //移除遮盖
    [self removeFromSuperview];
}


@end
