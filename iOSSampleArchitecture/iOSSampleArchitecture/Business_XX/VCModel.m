//
//  VCModel.m
//  iOSSampleArchitecture
//
//  Created by LaiYoung_ on 2017/7/6.
//  Copyright © 2017年 LaiYoung_. All rights reserved.
//

#import "VCModel.h"
#import "SvcUser+Search.h"
#import "HttpRequestSearchContacts.h"

/** ---------------------------Macro----------------------------------- */

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

/** -------------------------------------------------------------- */

@implementation VCModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        @weakify(self)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            @strongify(self)
            //在此处进行本地数据库的数据读取
            // read loacal data;
            //  ....
            dispatch_async(dispatch_get_main_queue(), ^{
                @strongify(self)
                if (self.delegate && [self.delegate respondsToSelector:@selector(needReloadUI)]) {
                    [self.delegate needReloadUI];
                }
            });
        });
    }
    return self;
}

- (void)requestSeatchContactsWithKeyWords:(NSString *)keyWord
                                     page:(NSInteger)page
                                   result:(void(^)(HttpResponseSearchContacts *reponse, NSError *error))result {
    HttpRequestSearchContacts *contactRequest = [[HttpRequestSearchContacts alloc] init];
    contactRequest.keyWords = keyWord;
    contactRequest.pageSize = 20;
    contactRequest.requestPage = page;
    [SvcUser searchContactsWithRequest:contactRequest success:^(id responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            !result?:result(responseObject,nil);
        });
    } failure:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            !result?:result(nil,error);
        });
    }];
}

@end
