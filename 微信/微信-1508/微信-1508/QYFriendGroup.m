//
//  QYFriendGroup.m
//  LOL
//
//  Created by qingyun on 15/10/27.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYFriendGroup.h"
#import "QYFriend.h"
@implementation QYFriendGroup

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
       //把friends中的字典转换成模型friend
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            QYFriend *friend = [QYFriend friendWithDictionary:dict];
            [array addObject:friend];
        }
        self.friends = array;
    }
    return self;
}
+(instancetype)friendGroupWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
@end
