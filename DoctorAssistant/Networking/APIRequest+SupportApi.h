//
//  APIRequest+SupportApi.h
//  EmployeeAssistant
//
//  Created by 武淅 段 on 16/9/12.
//  Copyright © 2016年 xxkuaipao. All rights reserved.
//

#import "APIRequest.h"
#import "APIObjects.h"

@interface APIRequest (SupportApis)

/**
 *  获取场馆教练列表
 */
+ (APIRequest *) coachList;

@end
