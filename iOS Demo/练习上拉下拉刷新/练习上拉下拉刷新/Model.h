//
//  Model.h
//  练习上拉下拉刷新
//
//  Created by  syc on 16/4/22.
//  Copyright © 2016年 HK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

/**
 
 {
  = "2016-04-19 16:55:05.0";
  = "2016-05-19 17:01:14.0";
  = "\U901a\U4fe1\U90e8";
  = "<null>";
  = 15;
  = "\U901a\U4fe1\U90e8";
  = 80;
  = 0;
  = 3;
  = "\U8f6f\U4ef6\U90e8";
  = 3;
  = 4;
  = "\U9a6c\U4e91";
  = "\U5f00\U53d1\U7684\U8f6f\U4ef6\U4e0d\U7ba1\U7528";
  = "<null>";
  = "192.168.6.137";
  = "\U963f\U91cc\U5df4\U5df4";
  = "\U4e0d\U60f3\U7ba1";
  = 123123;
  = "\U4e5f\U4e0d\U9000\U94b1";
  = "\U592a\U5751\U4e86";
  =         (
 );
  = "<null>";
  =         (
 );
  = "2016-04-19 17:00:51.0";
 }
 */
@property (nonatomic, copy) NSString *fdCommitdate;
@property (nonatomic, copy) NSString *fdExeeddate;
@property (nonatomic, copy) NSString *fiAimsector;
@property (nonatomic, copy) NSString *fiCompanyid;
@property (nonatomic, copy) NSNumber *fiComplainid;
@property (nonatomic, copy) NSString *fiCursector;
@property (nonatomic, copy) NSNumber *fiDealid;
@property (nonatomic, copy) NSNumber *fiEvaluate;
@property (nonatomic, copy) NSNumber *fiRebutnum;
@property (nonatomic, copy) NSString *fiSector;
@property (nonatomic, copy) NSNumber *fiStatus;
@property (nonatomic, copy) NSNumber *fiWay;
@property (nonatomic, copy) NSString *fsContacts;
@property (nonatomic, copy) NSString *fsContents;
@property (nonatomic, copy) NSString *fsEvaluatecontent;
@property (nonatomic, copy) NSString *fsIp;
@property (nonatomic, copy) NSString *fsName;
@property (nonatomic, copy) NSString *fsPace;
@property (nonatomic, copy) NSNumber *fsPhonenumber;
@property (nonatomic, copy) NSString *fsRemark;
@property (nonatomic, copy) NSString *fsTopic;
@property (nonatomic, copy) NSString *gxjDeals;
@property (nonatomic, copy) NSString *qyssCompany;
@property (nonatomic, copy) NSString *qyssComplainAttaches;
@property (nonatomic, copy) NSString *transpondDate;

- (instancetype)initWithDict:(NSDictionary *)dict;


@end
