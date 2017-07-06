//
//  SvcUser+Search.h
//  iOSSampleArchitecture
//
//  Created by LaiYoung_ on 2017/7/6.
//  Copyright © 2017年 LaiYoung_. All rights reserved.
//

#import "SvcUser.h"

@class HttpRequestSearchContacts;

@interface SvcUser (Search)

/**
 *  搜索联系人
 */
+ (void)searchContactsWithRequest:(HttpRequestSearchContacts *)requestObject
                          success:(HttpSuccessBlock)success
                          failure:(HttpFailureBlock)failure;

@end
