//
//  NetworkTools.m
//  测试05
//
//  Created by Mac on 2018/12/3.
//  Copyright © 2018年 www.alpaca.com. All rights reserved.
//

#import "NetworkTools.h"

@implementation NetworkTools
+(instancetype)sharedTools{
    static NetworkTools *tools;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:@"http://www.weather.com.cn/"];
        tools = [[self alloc] initWithBaseURL:baseURL];
    });
    return tools;
}

@end
