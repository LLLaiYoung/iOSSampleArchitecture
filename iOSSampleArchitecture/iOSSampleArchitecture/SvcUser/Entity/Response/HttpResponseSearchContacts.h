//
//  HttpResponseSearchContacts.h
//  iOSSampleArchitecture
//
//  Created by LaiYoung_ on 2017/7/6.
//  Copyright © 2017年 LaiYoung_. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  SeachContacts Response 实体类
 */

@interface HttpResponseSearchContacts : NSObject
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *contactId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@end
