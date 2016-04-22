//
//  LHBottomPickerView.h
//  LHEditPickerView
//
//  Created by 刘旭辉 on 16/4/18.
//  Copyright © 2016年 刘旭辉. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LHEditPickView.h"
@interface LHBottomPickerView : UIView
@property (nonatomic,weak)UIView *grayBgView;
@property (nonatomic,weak)LHEditPickView *editView;
@property (nonatomic,weak)UIViewController *controller;
@property (nonatomic,copy)void (^bottomResultPresent)(NSString *);
@property (nonatomic,strong)UITapGestureRecognizer *recognizer;

+(instancetype)showWithController:(UIViewController *)controller andData:(NSArray *)data;
-(instancetype)initWithController:(UIViewController *)controller;

+(void)showEditPickerViewWithController:(UIViewController *)controller andData:(NSArray *)data andBlock:(void (^)(NSString *temp))bottomResultPresent;

@end
