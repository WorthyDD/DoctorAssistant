//
//  SlideRefreshView.h
//  EmployeeAssistant
//
//  Created by 武淅 段 on 16/10/8.
//  Copyright © 2016年 xxkuaipao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideRefreshView : UIView


- (instancetype) initWithRefreshTip : (NSString*) tip;
- (void) startAnimation;
- (void) endAnimation;

@end
