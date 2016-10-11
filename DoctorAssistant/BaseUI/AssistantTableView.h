//
//  AssistantTableView.h
//  EmployeeAssistant
//
//  Created by 武淅 段 on 16/10/8.
//  Copyright © 2016年 xxkuaipao. All rights reserved.
//  集成下拉刷新  空提示 重新加载等等
//

#import <UIKit/UIKit.h>


typedef void(^refreshCallback)();
@interface AssistantTableView : UITableView

@property (nonatomic, copy) refreshCallback loadDataHandler;    //下拉刷新
@property (nonatomic, copy) refreshCallback netfailDoneHandler;    //断网重新加载



/**
 *  设置空白页的标题 图片 按钮标题 
 */
- (void) setEmptyImage : (UIImage *)image title : (NSString *)title actionTitle : (NSString *)actionTitle;

/**
 *  设置空白页的隐藏
 */
- (void) setEmptyViewHidden : (BOOL)hidden;

@end
