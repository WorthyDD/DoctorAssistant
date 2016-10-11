//
//  SlideRefreshView.m
//  EmployeeAssistant
//
//  Created by 武淅 段 on 16/10/8.
//  Copyright © 2016年 xxkuaipao. All rights reserved.
//

#import "SlideRefreshView.h"
#import "constant.h"
#import "Tookit.h"

@interface SlideRefreshView()

@property (nonatomic) UIView *mask;

@end
@implementation SlideRefreshView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithRefreshTip:(NSString *)tip
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
    if(self){
        self.clipsToBounds = YES;
//        [self setBackgroundColor:[UIColor redColor]];
        UIImageView *logo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 36, 36)];
        [logo setImage:[UIImage imageNamed:@"logo"]];
        [logo setContentMode:UIViewContentModeScaleAspectFit];
        logo.center = CGPointMake(SCREEN_WIDTH/2-40, 30);
        [self addSubview:logo];
        
        UIImageView *logoGray = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 36, 36)];
        [logoGray setImage:[UIImage imageNamed:@"logo-gray"]];
        [logoGray setContentMode:UIViewContentModeScaleAspectFit];
        logoGray.center = CGPointMake(SCREEN_WIDTH/2-40, 30);
        [self addSubview:logoGray];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-8, 0, SCREEN_WIDTH, 60)];
        [label setTextColor:TEXT_COLOR_GRAY_LIGHT];
        [label setText:tip];
        [label setFont:[UIFont systemFontOfSize:14.0]];
        [self addSubview:label];
        UIView *mask = [[UIView alloc]initWithFrame:logo.bounds];
        [mask setBackgroundColor:[UIColor grayColor]];
        logoGray.maskView = mask;
        self.mask = mask;
        
    }
    return self;
}

- (void)startAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.duration = 2;
    animation.fromValue = @(54);
    animation.toValue = @(18);
    animation.removedOnCompletion = NO;
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = NO;
    [_mask.layer addAnimation:animation forKey:nil];
//    [self.layer addAnimation:animation forKey:nil];
}

- (void)endAnimation
{
    [_mask.layer removeAllAnimations];
}

@end
