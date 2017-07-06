//
//  HttpClient.h
//  iOSSampleArchitecture
//
//  Created by LaiYoung_ on 2017/7/6.
//  Copyright © 2017年 LaiYoung_. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^HttpSuccessBlock) (id responseObject);
typedef void (^HttpFailureBlock) (NSError *error);

/** 
 *  网络请求
 */

@interface HttpClient : NSObject

+ (NSURLSessionDataTask *)GET:(NSString *)requestURLString
                withParameter:(NSDictionary *)parameter
                      success:(HttpSuccessBlock)success
                      failure:(HttpFailureBlock)failure;

+ (NSURLSessionDataTask *)POST:(NSString *)requestURLString
                 withParameter:(NSDictionary *)parameter
                       success:(HttpSuccessBlock)success
                       failure:(HttpFailureBlock)failure;

@end
