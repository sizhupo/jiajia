//
//  LHBottomPickerView.m
//  LHEditPickerView
//
//  Created by 刘旭辉 on 16/4/18.
//  Copyright © 2016年 刘旭辉. All rights reserved.
//

#import "LHBottomPickerView.h"
#import "AppDelegate.h"

@interface LHBottomPickerView()<UIGestureRecognizerDelegate>

@end

@implementation LHBottomPickerView

-(instancetype)initWithController:(UIViewController *)controller{
    self=[super init];
    if(self){
        //黑色半透明背景
        AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
        UIView *grayBgView=[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        grayBgView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [app.window.rootViewController.view addSubview:grayBgView];
        grayBgView.hidden=YES;
        self.grayBgView=grayBgView;
        
        //为grayBgView添加点击手势
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
        tapGestureRecognizer.numberOfTapsRequired = 1; // 设置单击几次才触发方法
        [self.grayBgView setUserInteractionEnabled:YES];
        tapGestureRecognizer.delegate=self;
        [tapGestureRecognizer addTarget:self action:@selector(popAndPushPickerView)]; // 添加点击手势的方法
        tapGestureRecognizer.cancelsTouchesInView = NO;
        [self.grayBgView addGestureRecognizer:tapGestureRecognizer];
        self.recognizer=tapGestureRecognizer;
        
        
        //LHEditPickerView
        LHEditPickView *editView=[[LHEditPickView alloc]initWithFrame:CGRectMake(0, controller.view.bounds.size.height, controller.view.bounds.size.width, controller.view.bounds.size.height/5*2)];
        self.editView=editView;
        self.editView.refreshUserInterface=^(NSString * result){
            if(self.bottomResultPresent){
                self.bottomResultPresent(result);
            }
        };
        self.editView.dropEditPickerView=^(){
            [self popAndPushPickerView];
        };
        [self.grayBgView addSubview:editView];
        
    }
    return self;
}

+(instancetype)showWithController:(UIViewController *)controller andData:(NSArray *)data{
    LHBottomPickerView *bottom=[[self alloc]initWithController:controller];
    bottom.controller=controller;
    bottom.editView.data=data;
    [controller.view addSubview:bottom];
    [bottom popAndPushPickerView];
    return  bottom;
}


-(void)popAndPushPickerView{
    if(self.grayBgView.hidden){
        [UIView animateWithDuration:0.5 animations:^{
            self.grayBgView.hidden=NO;
            self.editView.frame=CGRectMake(0, self.controller.view.bounds.size.height/5*3, self.controller.view.bounds.size.width, self.controller.view.bounds.size.height/5*2);
        }];
        [self.grayBgView setUserInteractionEnabled:YES];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self.editView.frame=CGRectMake(0, self.controller.view.bounds.size.height, self.controller.view.bounds.size.width, self.controller.view.bounds.size.height/5*2);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                self.grayBgView.hidden=YES;
            }];
        }];
        
    }

}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ( [touch.view isKindOfClass:[UIButton class]])
    {
        return NO;
    }
    //由于LHEdiPickView中的toolView也受到了手势的影响，所以在这里将这这个ToolView屏蔽掉
    if([touch.view isKindOfClass:[UIToolbar class]]){
        return NO;
    }
    
    return YES;
}

+(void)showEditPickerViewWithController:(UIViewController *)controller andData:(NSArray *)data andBlock:(void (^)(NSString *temp))bottomResultPresent{
    LHBottomPickerView *bottom=[LHBottomPickerView showWithController:controller andData:data];
    bottom.bottomResultPresent=bottomResultPresent;
}


@end
