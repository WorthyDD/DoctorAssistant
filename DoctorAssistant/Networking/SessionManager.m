//
//  SessionManager.m
//  EmployeeAssistant
//
//  Created by 武淅 段 on 16/10/10.
//  Copyright © 2016年 xxkuaipao. All rights reserved.
//

#import "SessionManager.h"
#import "constant.h"

@implementation SessionManager

+ (instancetype)shareManager
{
    static SessionManager *shareManager;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        shareManager = [[SessionManager alloc]init];
    });
    return shareManager;
}

- (void)loginWithUserName:(NSString *)name password:(NSString *)password completion:(void (^)(BOOL, NSError *))completion
{
    WEAK_OBJ_REF(self);
    APIRequest *request = [[APIRequest alloc]initWithApiPath:@"/login" method:APIRequestMethodPost];
    request.params = @{@"username" : name,
                       @"password" : password};
    request.resultObjectClass = [User class];
    [[APIManager shareManager] requestWithAPI:request completion:^(id result, NSError *error) {
        if(result){
            weak_self.user = result;
            weak_self.isLogin = YES;
            completion(YES, nil);
        }
        if(error){
            weak_self.user = nil;
            weak_self.isLogin = NO;
            completion(NO, error);
        }
    }];
}


- (void)setIsLogin:(BOOL)isLogin
{
    _isLogin = isLogin;
    [[NSUserDefaults standardUserDefaults] setBool:isLogin forKey:kloginStatusBOOLKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
