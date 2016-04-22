//
//  Model.m
//  练习上拉下拉刷新
//
//  Created by  syc on 16/4/22.
//  Copyright © 2016年 HK. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
