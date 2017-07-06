//
//  HttpRequestSearchContacts.h
//  iOSSampleArchitecture
//
//  Created by LaiYoung_ on 2017/7/6.
//  Copyright © 2017年 LaiYoung_. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  SeachContacts Request 实体类
 */

@interface HttpRequestSearchContacts : NSObject
@property (nonatomic, copy) NSString *keyWords;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) NSInteger requestPage;
@end
