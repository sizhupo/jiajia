//
//  QYFirend.m
//  03-QQ好友
//
//  Created by 青云-wjl on 15/9/16.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYFirend.h"

@implementation QYFirend
- (instancetype) initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        //拿字典数据直接灌入模型属性
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype) friendWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
@end
