
//
//  QYTGModel.h
//  微信-1508
//
//  Created by qingyun on 15/11/3.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYTGModel : NSObject
@property (nonatomic, strong) NSString *buycount;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *title;

-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)tgModelWithDictionary:(NSDictionary *)dict;
@end
