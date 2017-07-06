//
//  VCModel.h
//  iOSSampleArchitecture
//
//  Created by LaiYoung_ on 2017/7/6.
//  Copyright © 2017年 LaiYoung_. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HttpResponseSearchContacts;

/**
 *  Model只负责提供数据／数据处理（网络／本地）
 *  本地数据的处理，则可以在init的时候在子线程读取数据，待数据读取完毕之后返回UI线程通知VC刷新UI
 */

@protocol ModelDelegate <NSObject>

@optional

- (void)needReloadUI;

@end

@interface VCModel : NSObject
@property (nonatomic, weak) id<ModelDelegate> delegate;

- (void)requestSeatchContactsWithKeyWords:(NSString *)keyWord
                                     page:(NSInteger)page
                                   result:(void(^)(HttpResponseSearchContacts *reponse, NSError *error))result;

@end
