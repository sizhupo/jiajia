//
//  NextViewController.h
//  Block块的传值
//
//  Created by  syc on 16/3/29.
//  Copyright © 2016年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXChangeLabelValue.h"

@interface NextViewController : UIViewController

/**协议属性*/
@property (nonatomic, assign) id<WXChangeLabelValue> delegate;


@end
