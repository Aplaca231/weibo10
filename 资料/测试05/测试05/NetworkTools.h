//
//  NetworkTools.h
//  测试05
//
//  Created by Mac on 2018/12/3.
//  Copyright © 2018年 www.alpaca.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
@interface NetworkTools : AFHTTPSessionManager

+(instancetype)sharedTools;


@end
