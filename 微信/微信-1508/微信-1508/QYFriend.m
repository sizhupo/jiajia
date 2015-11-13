//
//  QYFriend.m
//  LOL
//
//  Created by qingyun on 15/10/27.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYFriend.h"

@implementation QYFriend

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        //使用kvc的方式灌入数据
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)friendWithDictionary:(NSDictionary *)dict
{
    return [[self alloc]initWithDictionary:dict];
}
@end
