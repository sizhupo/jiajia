//
//  WXGuideVC.m
//  Smile育儿搜
//
//  Created by qingyun on 16/1/14.
//  Copyright © 2016年 com.hnqigyun.Smile. All rights reserved.
//

#import "WXGuideVC.h"
#import "WXTabBarVCr.h"

#define KGuideCount 3

@interface WXGuideVC ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIPageControl *pageControl;
@end

@implementation WXGuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.添加ScrollewView
    [self setupScrollView];
    
    //2.添加PageController
    [self setupPageControl];
}

/** 添加ScrollewView*/
- (void)setupScrollView
{
    //1.添加ScrollView
    UIScrollView *ScrollewView = [[UIScrollView alloc] init];
    ScrollewView.frame = self.view.bounds;
    ScrollewView.delegate  =self;
    [self.view addSubview:ScrollewView];
    
    //2.添加图片
    CGFloat ImageW = self.view.width;
    CGFloat ImageH = self.view.height;
    for (int i = 0; i < KGuideCount; i++) {
        //创建UIImageView
        UIImageView *imgView = [[UIImageView alloc] init];
        NSString *imgName = [NSString stringWithFormat:@"new_feature_%d",i + 1];
        imgView.image = [UIImage imageNamed:imgName];
        [ScrollewView addSubview:imgView];
        //设置frame
        imgView.y = 0;
        imgView.width = ImageW;
        imgView.height = ImageH;
        imgView.x = ImageW * i;
        
        //给最后一个imageView添加一个Button
        if (i == KGuideCount - 1) {
            [self setupLastImageView:imgView];
        }
    }
    
    //3.设置其他的属性
    ScrollewView.contentSize = CGSizeMake(ImageW * KGuideCount, 0);
    ScrollewView.pagingEnabled = YES;
    ScrollewView.showsVerticalScrollIndicator = NO;
    ScrollewView.showsHorizontalScrollIndicator = YES;
    ScrollewView.backgroundColor = [UIColor clearColor];
}

/** 给最后一个图片设置Btn*/
- (void)setupLastImageView:(UIImageView *)imgView
{
    imgView.userInteractionEnabled = YES;
    //添加开始按钮
    [self setupStartBtn:imgView];
}

/** 添加开始按钮*/
- (void)setupStartBtn:(UIImageView *)imageView
{
    UIButton *startBtn = [[UIButton alloc] init];
    [imageView addSubview:startBtn];
    
    // 3.设置frame
    [startBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    [startBtn setTitleColor:[UIColor skyBlueColor] forState:UIControlStateNormal];
    startBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    
    startBtn.centerX = self.view.width * 0.6+15;
    startBtn.centerY = self.view.height * 0.8+20;
    startBtn.width  = 100;
    startBtn.height = 50;
    [startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];

}

//开始体验
- (void)start
{
    [UIApplication sharedApplication].statusBarHidden = NO;
    WXTabBarVCr *TabBarVC = [[WXTabBarVCr alloc] init];
    
    //切换控制器
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    keyWindow.rootViewController = TabBarVC;
}
/** 添加PageController*/
- (void)setupPageControl
{
    //1.添加
    UIPageControl *PageControl = [[UIPageControl alloc] init];
    PageControl.numberOfPages = KGuideCount;
    PageControl.centerX = self.view.width * 0.5;
    PageControl.centerY = self.view.height - 30;
    [self.view addSubview:PageControl];
    //2.设置源点的颜色
    PageControl.currentPageIndicatorTintColor = [UIColor redColor];
    PageControl.pageIndicatorTintColor = [UIColor greenColor];
    
    self.pageControl = PageControl;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat CurrentPage = scrollView.contentOffset.x / scrollView.width;
    
    int Page = (int)(CurrentPage + 0.5);
    
    self.pageControl.currentPage = Page;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
