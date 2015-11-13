//
//  QYAlbumViewController.m
//  微信
//
//  Created by 青云-wjl on 15/9/22.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYAlbumViewController.h"
#import "QYScrollView.h"

#define kScreenW    [UIScreen mainScreen].bounds.size.width
#define kScreenH    [UIScreen mainScreen].bounds.size.height
#define imageViewCount 3
@interface QYAlbumViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation QYAlbumViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"相册";
    
    [self setScrollView];
    [self addSubScrollViews];
    // Do any additional setup after loading the view.
}

-(void)setScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW + 30, kScreenH)];
    [self.view addSubview:_scrollView];
    //必须设置contentSize
    _scrollView.contentSize = CGSizeMake((kScreenW + 30) * imageViewCount, kScreenH);
    
    _scrollView.pagingEnabled = YES;
    //
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    _scrollView.delegate = self;
}

//缩放功能的实现大的ScrollView里加小的ScrollView
- (void)addSubScrollViews
{
    for (int i = 0; i < imageViewCount; i++) {
        QYScrollView *imgScrollView = [[QYScrollView alloc] initWithFrame:CGRectMake(i*(kScreenW+30), 0, kScreenW, kScreenH)];
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d",i+1];
        imgScrollView.imageView.image = [UIImage imageNamed:imageName];
        [_scrollView addSubview:imgScrollView];
    }
}

#pragma mark UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    for (UIScrollView *sView in _scrollView.subviews) {
        if ([sView isKindOfClass:[UIScrollView class]]) {
            sView.zoomScale = 1.0;
        }
    }
}

@end
