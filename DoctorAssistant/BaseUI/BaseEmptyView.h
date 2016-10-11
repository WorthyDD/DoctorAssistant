//
//  BaseEmptyView.h
//  EmployeeAssistant
//
//  Created by 武淅 段 on 16/10/8.
//  Copyright © 2016年 xxkuaipao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol EmptyViewDelegate;

@interface BaseEmptyView : UIView

@property (nonatomic, weak) id<EmptyViewDelegate> delegate;

/**
 *  设置空白页的标题 图片 按钮标题
 */
- (void) setEmptyImage : (UIImage *)image title : (NSString *)title actionTitle : (NSString *)actionTitle;

@end

@protocol EmptyViewDelegate <NSObject>

- (void) didTapDoneButtonInView : (BaseEmptyView *)view;


@end
