//
//  SvcUser+Search.m
//  iOSSampleArchitecture
//
//  Created by LaiYoung_ on 2017/7/6.
//  Copyright © 2017年 LaiYoung_. All rights reserved.
//

#import "SvcUser+Search.h"
#import "HttpResponseSearchContacts.h"
#import "HttpRequestSearchContacts.h"

@implementation SvcUser (Search)
+ (void)searchContactsWithRequest:(HttpRequestSearchContacts *)requestObject
                          success:(HttpSuccessBlock)success
                          failure:(HttpFailureBlock)failure {
    // request 请求
    NSString *requestUrl = @"requestUrl";
    /** parameter 参数，通过 runtime 的将 Objct 转换成 NSDictionary */
    [HttpClient GET:requestUrl withParameter:requestObject.obj_dictionary success:^(id responseObject) {
        /** 通过 runtime 将返回的 responseObject 转换成 HttpResponseSearchContacts 对象 */
        HttpResponseSearchContacts *response = [HttpResponseSearchContacts new];
        !success?:success(response);
    } failure:failure];
}
@end
