//
//  QYFriendGroup.h
//  03-QQ好友
//
//  Created by 青云-wjl on 15/9/16.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYFriendGroup : NSObject
//属性
@property (nonatomic, strong)NSString *name;
@property (nonatomic)int online;
@property (nonatomic, strong)NSMutableArray *friends;

@property (nonatomic) BOOL isOpen;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)friendGroupWithDictionary:(NSDictionary *)dict;
@end
