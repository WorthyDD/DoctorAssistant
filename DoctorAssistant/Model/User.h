//
//  User.h
//  EmployeeAssistant
//
//  Created by 武淅 段 on 16/10/10.
//  Copyright © 2016年 xxkuaipao. All rights reserved.
//

#import "BaseObject.h"

@interface User : BaseObject

@property (nonatomic, assign) BOOL isAdmin;     //是否是管理员
@property (nonatomic) NSString *name;

@end
