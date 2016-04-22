//
//  LHRefreshTableView.h
//  HKLinkInfo
//
//  Created by HKMac on 16/4/6.
//  Copyright © 2016年 HKMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"


@protocol LHRefreshDelegate <NSObject>

-(void)refreshData;
-(void)loadMoreData;

@end

@interface LHRefreshTableView : UITableView

@property (nonatomic,assign)id<LHRefreshDelegate> refreshDelegate;

-(void)refreshing;

-(void)refreshNormal;

@end
