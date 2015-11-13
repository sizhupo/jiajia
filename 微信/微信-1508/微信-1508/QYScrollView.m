//
//  QYScrollView.m
//  01-相册
//
//  Created by qingyun on 15/10/23.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYScrollView.h"

@interface QYScrollView ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIImageView *imgView;
@end

@implementation QYScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:imageView];
        _imgView = imageView;
        
        //设置自身的属性
        self.maximumZoomScale = 2;
        self.minimumZoomScale = 0.5;
        self.delegate = self;
        
        //添加双击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
        //设置有效点击数
        tap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap];                          
    }
    return self;
}

-(void)doubleClick:(UITapGestureRecognizer *)tap
{
    //当前的缩放比例不为1.0 的时候，置为1.0
    if (self.zoomScale != 1.0) {
        self.zoomScale = 1.0;
        return;
    }
    //当前的缩放比例为1.0 的时候,放大一个指定的矩形区域
    CGPoint location = [tap locationInView:self];
    
    CGRect rect = CGRectMake(location.x - 100, location.y - 100, 200, 200);
    
    [self zoomToRect:rect animated:YES];
}

//设置imageView的Image
-(void)setImg:(UIImage *)img
{
    //setter方法本身要完成的事情
   _img = img;
    
    //额外完成的事情
   _imgView.image = img;
}

////方法设置
//-(void)setImage:(UIImage *)image
//{
//    _imgView.image = image;
//}

#pragma mark - UIScrollViewDelegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imgView;
}

@end
