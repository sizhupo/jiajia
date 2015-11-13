//
//  QYFriendGroup.h
//  LOL
//
//  Created by qingyun on 15/10/27.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYFriendGroup : NSObject
//声明属性
@property (nonatomic, strong) NSMutableArray *friends;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger online;
//打开状态
@property (nonatomic) BOOL isOpen;

//初始化方法
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)friendGroupWithDictionary:(NSDictionary *)dict;
@end
