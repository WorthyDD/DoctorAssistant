//
//  BaseEmptyView.m
//  EmployeeAssistant
//
//  Created by 武淅 段 on 16/10/8.
//  Copyright © 2016年 xxkuaipao. All rights reserved.
//

#import "BaseEmptyView.h"

@interface BaseEmptyView()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@end

@implementation BaseEmptyView


- (IBAction)didTapDoneButton:(UIButton *)sender {
    
    if(_delegate && [_delegate respondsToSelector:@selector(didTapDoneButtonInView:)]){
        [_delegate didTapDoneButtonInView:self];
    }
}

/**
 *  设置空白页的标题 图片 按钮标题
 */
- (void) setEmptyImage : (UIImage *)image title : (NSString *)title actionTitle : (NSString *)actionTitle{
    if(image){
        _imageView.hidden = NO;
        [_imageView setImage:image];
    }
    else{
        _imageView.hidden = YES;
    }
    if(title){
        _titleLabel.hidden = NO;
        [_titleLabel setText:title];
    }
    else{
        _titleLabel.hidden = YES;
    }
    if(actionTitle){
        _doneButton.hidden = NO;
        [_doneButton setTitle:actionTitle forState:UIControlStateNormal];
    }
    else{
        _doneButton.hidden = YES;
    }
}
@end
