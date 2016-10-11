//
//  APIRequest+SupportApi.m
//  EmployeeAssistant
//
//  Created by 武淅 段 on 16/9/12.
//  Copyright © 2016年 xxkuaipao. All rights reserved.
//

#import "APIRequest+SupportApi.h"

@implementation APIRequest (SupportApis)


+ (APIRequest *)coachList
{
    APIRequest *request = [[APIRequest alloc]initWithApiPath:@"/client/gym/3481/coach-with-erp" method:APIRequestMethodGet];
    request.resultObjectClass = [CoachList class];
    return request;
}

@end
