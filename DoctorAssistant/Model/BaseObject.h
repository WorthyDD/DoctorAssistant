//
//  BaseObject.h
//  EmployeeAssistant
//
//  Created by 武淅 段 on 16/8/30.
//  Copyright © 2016年 xxkuaipao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseObject <NSObject>

/**
 *  由JSON对象生成本地对象
 */
+ (instancetype) objectWithJson : (id)jsonObject;

@end

@interface BaseObject : NSObject<BaseObject>

// json key - local property
+ (NSDictionary *) JSONMap;

// json key - local class
+ (NSDictionary *) classMap;

// json array key - local element class
+ (NSDictionary *) arrayElementMap;


- (instancetype) initWithJsonObject : (NSDictionary *)jsonObject;

@end
