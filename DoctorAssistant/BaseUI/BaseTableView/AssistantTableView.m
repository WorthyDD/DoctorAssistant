//
//  AssistantTableView.m
//  EmployeeAssistant
//
//  Created by 武淅 段 on 16/10/8.
//  Copyright © 2016年 xxkuaipao. All rights reserved.
//

#import "AssistantTableView.h"
#import "SlideRefreshView.h"
#import "BaseEmptyView.h"

//刷新状态
typedef NS_ENUM(NSUInteger, RefreshingState)
{
    RefreshingStateStop = 0,    //闲置状态
    RefreshingStateRefreshing,  //刷新中
};


@interface AssistantTableView()<EmptyViewDelegate>

@property (nonatomic) SlideRefreshView *refreshView;
@property (nonatomic, assign) RefreshingState state;
@property (nonatomic) BaseEmptyView *emptyView; //空白页

@end
@implementation AssistantTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
        [self commenInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if(self){
        [self commenInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self commenInit];
    }
    return self;
}


- (void) commenInit
{
    _refreshView = [[SlideRefreshView alloc]initWithRefreshTip:@"下拉可刷新"];
    UINib *nib = [UINib nibWithNibName:@"BaseEmptyView" bundle:nil];
    _emptyView = [[nib instantiateWithOwner:nil options:nil] lastObject];
}

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    [self.superview addSubview:_refreshView];
    [self addSubview:_emptyView];
    _emptyView.delegate = self;
    [self setEmptyViewHidden:YES];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame = _refreshView.frame;
    frame.origin.y = self.frame.origin.y;
    _refreshView.frame = frame;
    _emptyView.frame = self.bounds;
}


- (void)setContentOffset:(CGPoint)contentOffset
{
    [super setContentOffset:contentOffset];
    NSLog(@"\n--%f,%f, %f", self.contentInset.top, self.contentOffset.y, self.frame.origin.y);
    CGRect frame = _refreshView.frame;
    if(contentOffset.y > -60 && contentOffset.y < 0){
        frame.size.height = fabs(contentOffset.y);
        if(!self.dragging && self.state == RefreshingStateRefreshing){
            
            [super setContentOffset:CGPointMake(0, -60)];
            
        }
        else{
            self.state = RefreshingStateStop;
        }
    }
    else if(contentOffset.y <= -60){
        [_refreshView startAnimation];
        frame.size.height = 60;
        self.state = RefreshingStateRefreshing;
        if(self.loadDataHandler){
            self.loadDataHandler();
        }
    }
    else{
        [_refreshView endAnimation];
        frame.size.height = 0;
        self.state = RefreshingStateStop;
    }
    _refreshView.frame = frame;
}

#pragma mark - empty view delegate
- (void)didTapDoneButtonInView:(BaseEmptyView *)view
{
    //重新加载
    if(self.netfailDoneHandler){
        self.netfailDoneHandler();
    }
}

- (void)setEmptyImage:(UIImage *)image title:(NSString *)title actionTitle:(NSString *)actionTitle
{
    [_emptyView setEmptyImage : image title : title actionTitle : actionTitle];
}

- (void)setEmptyViewHidden:(BOOL)hidden
{
    self.scrollEnabled = hidden;
    _emptyView.hidden = hidden;
}

@end
