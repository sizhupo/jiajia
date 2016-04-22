//
//  LHEditPickView.m
//  LHEditPickerView
//
//  Created by 刘旭辉 on 16/4/15.
//  Copyright © 2016年 刘旭辉. All rights reserved.
//

#import "LHEditPickView.h"


@interface LHEditPickView()<UIPickerViewDelegate,UIPickerViewDataSource>{
    //按钮的宽度
    CGFloat _btnWidth;
    NSString *_result;
}

@end

@implementation LHEditPickView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        //主背景图
        UIView *mainBgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.mainBgView=mainBgView;
        mainBgView.backgroundColor=[UIColor whiteColor];
        [self addSubview:mainBgView];
        
        //ToolBar
        UIToolbar *toolView=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height/6)];
        [toolView setBackgroundImage:[UIImage imageNamed:@"daohangtiao"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        self.toolBarView=toolView;
        toolView.backgroundColor=[UIColor blueColor];
        [mainBgView addSubview:toolView];
        
        //取消，确定按钮
        _btnWidth=100.0;
        UIButton *cancelbtn=[UIButton buttonWithType:UIButtonTypeCustom];
        cancelbtn.frame=CGRectMake(0, 0, _btnWidth, CGRectGetHeight(toolView.frame));
        [cancelbtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelbtn addTarget:self action:@selector(onclickCancel:) forControlEvents:UIControlEventTouchUpInside];
        self.cancelBtn=cancelbtn;
        [toolView addSubview:cancelbtn];
        
        _btnWidth=100.0;
        UIButton *sureBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        sureBtn.frame=CGRectMake(frame.size.width-_btnWidth, 0, _btnWidth, CGRectGetHeight(toolView.frame));
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        self.sureBtn=sureBtn;
        [self.sureBtn addTarget:self action:@selector(onclickSure:) forControlEvents:UIControlEventTouchUpInside];
        [toolView addSubview:sureBtn];
        
        
        
        //UIPickerView
        UIPickerView *picker=[[UIPickerView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(toolView.frame), frame.size.width, (frame.size.height/6)*5)];
        self.pickerView=picker;
        picker.showsSelectionIndicator=YES;
        picker.delegate=self;
        picker.dataSource=self;
        [mainBgView addSubview:picker];
        
    }
    return self;
}

//设置data并且设设置_result的初始值
-(void)setData:(NSArray *)data{
    if(_data!=data){
        _data=data;
        _result=data[0];
    }
    //刷新所有元素
    [self.pickerView reloadAllComponents];
}

#pragma mark -ButtonClick

-(void)onclickCancel:(id)sender{
    if(self.dropEditPickerView){
        self.dropEditPickerView();
    }
}



//确定按钮,block传值
-(void)onclickSure:(id)sender{
    if(self.refreshUserInterface){
        self.refreshUserInterface(_result);
    }
    if(self.dropEditPickerView){
        self.dropEditPickerView();
    }
}

#pragma mark -PickerViewDelegate
//有多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.data.count;
}
//有多少列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//设置每一行的内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.data[row];
}

//设置选中结果
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _result=self.data[row];
}


@end
