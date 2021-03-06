//
//  constant.h
//  EmployeeAssistant
//
//  Created by 武淅 段 on 16/9/5.
//  Copyright © 2016年 xxkuaipao. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef constant_h
#define constant_h

#define WEAK_OBJ_REF(obj) __weak typeof(obj) weak_##obj = obj
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define THEME_COLOR [UIColor colorWithRGB:0xfd6e37]

#define TITLE_COLOR_GRAY [UIColor colorWithRGB:0x666666]
#define TEXT_COLOR_DARK [UIColor colorWithRGB:0x333333]
#define TEXT_COLOR_GRAY_LIGHT [UIColor colorWithRGB:0x999999]
#define BACKGROUND_LIGHT_GRAY [UIColor colorWithRGB:0xf1f1f1]
#define BORDER_GRAY_COLOR [UIColor colorWithRGB:0xc7c7c7]

//通知变量定义区
#define kLoginSuccessNotification @"login_success"
#define kLogoutSuccessNotification @"logout_success"
#define kloginStatusBOOLKey @"login_status_bool_key"

#define COLOR_666666 [UIColor colorWithRGB:0x666666]
#define COLOR_333333 [UIColor colorWithRGB:0x333333]
#define COLOR_999999 [UIColor colorWithRGB:0x999999]
#define COLOR_F1F1F1 [UIColor colorWithRGB:0xf1f1f1]
#define COLOR_C7C7C7 [UIColor colorWithRGB:0xc7c7c7]
#define COLOR_DDDDDD [UIColor colorWithRGB:0xdddddd]
#define COLOR_BBBBBB [UIColor colorWithRGB:0xbbbbbb]


#endif /* constant_h */
