//
//  WXScore.m
//  PopMenu
//
//  Created by  syc on 16/4/16.
//  Copyright © 2016年 HK. All rights reserved.
//

#import "WXScore.h"

@interface WXScore ()
{
    CGFloat touch_Width;   /**触摸的宽度*/
    CGFloat star_Width;    /**开始的宽度*/
    CGFloat top_Magin;     /**顶部的间距*/
}

@end

@implementation WXScore

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    if(_Max_star<1)
        _Max_star = 5;

    self.backgroundColor = [UIColor clearColor];
    
    if(_Space<1){
        _Space = 2.f;
    }
    //添加滑动手势
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self addGestureRecognizer:singleTap];
    __weak id delegateSelf = self;
    singleTap.delegate = delegateSelf;
    singleTap.cancelsTouchesInView = NO;
}


- (void)handleSingleTap:(id)sender
{
    if (_isSelected) {
        CGPoint pt = [sender locationInView:self];
        if (pt.x > _LeftMargin) {

            // .计算点击的百分比
            _Show_star = (pt.x - _LeftMargin) / (star_Width + _Space) + 1;
            // .重新布局
            [self setNeedsDisplay];
        }
    }
}

/**
 *  布局子视图（星星）
 */
-(void)layoutSubviews{
    //宽度
    star_Width = (self.frame.size.width - 20.f - (_Max_star-1)*_Space)/_Max_star;
    star_Width = (star_Width > CGRectGetHeight(self.bounds))?CGRectGetHeight(self.bounds):star_Width;
    top_Magin = (self.bounds.size.height - star_Width)/2;
}

-(void)setIsSelect:(BOOL)isSelect{
    
    isSelect = isSelect;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    for (NSInteger i = 0; i<_Max_star; i++) {
        if (i<_Show_star) {
            [_highlightedImage drawInRect:CGRectMake(_LeftMargin + (star_Width + _Space)*i, top_Magin, star_Width, star_Width)];
        }
        else{
            [_normalImage drawInRect:CGRectMake(_LeftMargin + (star_Width + _Space)*i, top_Magin, star_Width, star_Width)];
        }
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_isSelected) {
        CGPoint pt = [[touches anyObject] locationInView:self];
        
        if (pt.x > _LeftMargin) {
            _Show_star = (pt.x - _LeftMargin
                          ) / (star_Width + _Space) + 1; //计算点击的百分比
            [self setNeedsDisplay];
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_isSelected) {
        CGPoint pt = [[touches anyObject] locationInView:self];
        
        if (pt.x > _LeftMargin) {
            _Show_star = (pt.x - _LeftMargin) / (star_Width + _Space) + 1; //计算点击的百分比
            [self setNeedsDisplay];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}


- (void)setShow_star:(NSInteger)show_star
{
    _Show_star = show_star;
    [self setNeedsDisplay];
}

- (void)setMax_star:(NSInteger)max_star
{
    _Max_star = max_star;
    star_Width = (self.frame.size.width - 20.f - (_Max_star-1)*_Space)/_Max_star;
    [self setNeedsDisplay];
}

- (void)setSpace:(CGFloat)space
{
    _Space = space;
    star_Width = (self.frame.size.width - 20.f - (_Max_star-1)*_Space)/_Max_star;
    [self setNeedsDisplay];
}

- (void)setNormalImg:(UIImage *)normalImg
{
    normalImg = normalImg;
    [self setNeedsDisplay];
}

- (void)setHighlightImg:(UIImage *)highlightImg
{
    highlightImg = highlightImg;
    [self setNeedsDisplay];
}


@end
