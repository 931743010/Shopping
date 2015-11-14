//
//  MyNetWorkQuery.m
//  天气预报
//
//  Created by kangkathy on 15/8/28.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "MyNetWorkQuery.h"

#define BaseURL @"http://apis.baidu.com/baidunuomi/openapi/"

@implementation MyNetWorkQuery

+ (void)requestData:(NSString *)urlString HTTPMethod:(NSString *)method  httpArg:(NSString *)httpArg completionHandle:(void(^)(id result))completionblock errorHandle:(void(^)(NSError *error))errorblock {
    
    //1.拼接URL
    NSString *urlStr = [NSString stringWithFormat:@"%@?%@",urlString,httpArg];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    
    //2.创建网络请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    request.HTTPMethod = method;
    [request addValue:@"5f6dcec6916a464d57fbb3e984201937" forHTTPHeaderField:@"apikey"];
    
    //5.发送异步网络请求
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError) {
            //出现错误时回调block
            errorblock(connectionError);
            
            return;
        }
        
        if (data) {
            
            //解析JSON
            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            //把JSON解析后的数据返回给调用者,回调block
            completionblock(jsonDic);
        }
    }];
    
}

+ (void)AFRequestData:(NSString *)urlString HTTPMethod:(NSString *)method params:(NSMutableDictionary *)params completionHandle:(void (^)(id))completionblock errorHandle:(void (^)(NSError *))errorblock {
    
    //拼接URL
    urlString = [BaseURL stringByAppendingString:urlString];

    //请求参数格式化对象，会根据类型拼接好给定格式
    AFHTTPRequestSerializer *requestSer = [AFHTTPRequestSerializer serializer];
    //使用请求参数格式化对象来构造一个request对象
    NSMutableURLRequest *request = [requestSer requestWithMethod:method URLString:urlString parameters:params error:nil];
    
    [request addValue:@"5f6dcec6916a464d57fbb3e984201937" forHTTPHeaderField:@"apikey"];
    
    //构造线程对象
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    //设置从服务器返回到客户端数据的解析方式，默认为JSON解析
    operation.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    //网络请求事件的监听,成功和失败返回的block
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (responseObject != nil) {
            
            completionblock(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"网络请求失败");
        errorblock(error);
        
    }];
    
    
    //发送网络请求，把网络请求任务添加到任务队列中执行
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
    
}




@end
