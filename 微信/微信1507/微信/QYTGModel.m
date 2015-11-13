//
//  QYTGModel.m
//  微信
//
//  Created by 青云-wjl on 15/9/22.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYTGModel.h"

@implementation QYTGModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        //
        //        _buycount = dict[@"buycount"];
        //        _icon = dict[@"icon"];
        //        _price = dict[@"price"];
        //        _title = dict[@"title"];
        
        
        // 灌入字典
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+ (instancetype)tgModelWithDcitionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

@end
