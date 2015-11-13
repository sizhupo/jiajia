//
//  ViewController.m
//  01-相册
//
//  Created by qingyun on 15/10/23.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYAlbumViewController.h"
#import "QYScrollView.h"
@interface QYAlbumViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@end

@implementation QYAlbumViewController
#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"相册";
    
    //创建并添加滚动的底部的ScrollView
    [self addScrollView];
    
    //在底部的ScrollView上添加缩放的scrollView
    [self addSubViewForScrollView];
    
    // Do any additional setup after loading the view, typically from a nib.
}
//创建并添加滚动的底部的ScrollView
-(void)addScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, QYScreenW + 25, QYScreenH)];
    [self.view addSubview:scrollView];
    
    //contentSize
    scrollView.contentSize = CGSizeMake((QYScreenW + 25) * 3, QYScreenH);
   
    scrollView.pagingEnabled = YES;
    
    scrollView.showsHorizontalScrollIndicator = NO;
    
    //scrollView.showsVerticalScrollIndicator = NO;
    
    scrollView.delegate = self;
    
    _scrollView = scrollView;
    
    _scrollView.backgroundColor = [UIColor blackColor];
    
}
//在底部的ScrollView上添加缩放的scrollView
-(void)addSubViewForScrollView
{
    for (int i = 0; i < 3; i++) {
        
        QYScrollView *qyScrollView = [[QYScrollView alloc] initWithFrame:CGRectMake((QYScreenW + 25) * i, 0, QYScreenW, QYScreenH)];
        [_scrollView addSubview:qyScrollView];
       
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d",i +  1];
        //通过方法设置
        //[qyScrollView setImage:[UIImage imageNamed:imageName]];
        //通过属性设置
        qyScrollView.img = [UIImage imageNamed:imageName];
    }
}

//减速完成  把上个界面的缩放的scrollview缩放比例设置1.0
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    for (id scroll in scrollView.subviews) {
        //判断scroll对象是否是QYScrollView类型的
        if ([scroll isKindOfClass:[QYScrollView class]]) {
            QYScrollView *qyScrollView = (QYScrollView *)scroll;
            //设置缩放比例
            qyScrollView.zoomScale = 1.0;
        }
    }
}

@end
