//
//  QYScrollView.m
//  相册
//
//  Created by wjl on 15/9/11.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYScrollView.h"

#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height

@interface QYScrollView ()<UIScrollViewDelegate>

@end

@implementation QYScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //设置自身的属性
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.delegate = self;
        
        self.minimumZoomScale = 0.5;
        self.maximumZoomScale = 1.5;
        
        //添加子视图
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, QYScreenW, QYScreenH)];
        [self addSubview:imageView];
        _imageView = imageView;
        
        //添加双击缩放功能
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
        tap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap];
    }
    return self;
}

-(void)doubleClick:(UITapGestureRecognizer *)tap
{
    UIScrollView *scrollV = (UIScrollView *)tap.view;
    if (scrollV.zoomScale != 1.0) {
        scrollV.zoomScale = 1.0;
        return;
    }
    
    CGPoint point = [tap locationInView:scrollV];
    CGFloat rectW = 200;
    CGFloat rectH = 300;
    CGRect rect = CGRectMake(point.x - rectW/2, point.y - rectH/2, rectW, rectH);
    [scrollV zoomToRect:rect animated:YES];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

@end
