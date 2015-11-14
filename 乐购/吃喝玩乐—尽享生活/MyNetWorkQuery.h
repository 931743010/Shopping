//
//  MyNetWorkQuery.h
//  天气预报
//
//  Created by kangkathy on 15/8/28.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyNetWorkQuery : NSObject

//使用NSURLConnection组件来做网络申请
+ (void)requestData:(NSString *)urlString HTTPMethod:(NSString *)method  httpArg:(NSString *)httpArg completionHandle:(void(^)(id result))completionblock errorHandle:(void(^)(NSError *error))errorblock;

//封装使用AFNetWorking来申请网络的方法
+ (void)AFRequestData:(NSString *)urlString HTTPMethod:(NSString *)method params:(NSMutableDictionary *)params completionHandle:(void(^)(id result))completionblock errorHandle:(void(^)(NSError *error))errorblock;


@end
