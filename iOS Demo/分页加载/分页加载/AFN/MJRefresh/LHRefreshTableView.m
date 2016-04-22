//
//  LHRefreshTableView.m
//  HKLinkInfo
//
//  Created by HKMac on 16/4/6.
//  Copyright © 2016年 HKMac. All rights reserved.
//

#import "LHRefreshTableView.h"

@implementation LHRefreshTableView


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self=[super initWithFrame:frame style:style];
    return self;
}

-(void)setRefreshDelegate:(id<LHRefreshDelegate>)refreshDelegate{
    if(_refreshDelegate!=refreshDelegate){
        _refreshDelegate=refreshDelegate;
        self.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [_refreshDelegate refreshData];
        }];
        // 设置自动切换透明度(在导航栏下面自动隐藏)
        self.mj_header.automaticallyChangeAlpha = YES;
    
        // 上拉加载
        self.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        // 设置了底部inset
        self.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
        // 忽略掉底部inset
        self.mj_footer.ignoredScrollViewContentInsetBottom = 30;
    }
}

-(void)loadMoreData{
    if([_refreshDelegate respondsToSelector:@selector(loadMoreData)]){
        [_refreshDelegate loadMoreData];
    }
}

-(void)refreshing{
    if(self.mj_header.state==MJRefreshStateIdle){
        [self.mj_header beginRefreshing];
    }
}

-(void)refreshNormal{
    if(self.mj_header.state==MJRefreshStateRefreshing){
        [self.mj_header endRefreshing];
    }else{
        [self.mj_footer endRefreshing];
    }
}

@end
