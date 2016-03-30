//
//  FirstVC.h
//  协议传值（纯代码）
//
//  Created by  syc on 16/3/30.
//  Copyright © 2016年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChangeLabelValueDelegate <NSObject>

@optional
/**协议方法*/
- (void)ChangeLabelValue:(NSString *)LabelValue;

@end

@interface FirstVC : UIViewController


@property (nonatomic, assign) id <ChangeLabelValueDelegate> delegate;

@end
