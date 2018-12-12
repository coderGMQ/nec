//
//  NECLoginNet.m
//  Nec
//
//  Created by 甘明强 on 2018/11/27.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import "NECLoginNet.h"

@interface NECLoginNet ()
@property (nonatomic, copy) LoginInCompleteBlock loginBlock;
@property (nonatomic, copy) RegisterCompleteBlock registerBlock;
@property (nonatomic, copy) SendCodeCompleteBlock sendCodeBlock;
@property (nonatomic, copy) VerifySecurityCodeCompleteBlock verifySecurityCodeBlock;
@property (nonatomic, copy) ResetPasswordCompleteBlock resetPasswordBlock;

@end

@implementation NECLoginNet

- (void)loginWithLoginName:(NSString *)loginName password:(NSString *)password deviceID:(NSString *)deviceID registrationID:(NSString *)registrationID platform:(NSString *)platform completeBlock:(LoginInCompleteBlock)completeBlock {
    self.loginBlock = completeBlock;
    NSDictionary *param = [HttpRequestParam paramLoginWithLoginName:loginName password:password deviceID:deviceID registrationID:registrationID platform:platform];
    NSString *suffixUrl = @"lxzy/user/login";
    [self makeRequestForType:ServiceType_api_login params:param method:@"POST" userInfo:nil suffixUrl:suffixUrl];
}

- (void)registerWithidCard:(NSString *)idCard loginName:(NSString *)loginName password:(NSString *)password phone:(NSString *)phone userName:(NSString *)userName completeBlock:(RegisterCompleteBlock)completeBlock {
    self.registerBlock = completeBlock;
    NSDictionary *param = [HttpRequestParam paramRegisterWithidCard:idCard loginName:loginName password:password phone:phone userName:userName];
    NSString *suffixUrl = @"lxzy/user/addUser.json";
    [self makeRequestForType:ServiceType_api_register params:param method:@"POST" userInfo:nil suffixUrl:suffixUrl];
}

- (void)getSendCodeWithPhone:(NSString *)phone  completeBlock:(SendCodeCompleteBlock)completeBlock {
    self.sendCodeBlock = completeBlock;
    NSDictionary *param = [HttpRequestParam paramSendCodeForgetPasswordWithPhone:phone];
    NSString *suffixUrl = @"api/sysUser/sendCheckNum.json";
    [self makeRequestForType:ServiceType_api_sendCode params:param method:@"POST" userInfo:nil suffixUrl:suffixUrl];
}

- (void)verifySecurityCodeWithCheckNum:(NSString *)checkNum key:(NSString *)key completeBlock:(VerifySecurityCodeCompleteBlock)completeBlock{
    self.verifySecurityCodeBlock = completeBlock;
    NSDictionary *param = [HttpRequestParam paramVerifySecurityCodeWithCheckNum:checkNum key:key];
    NSString *suffixUrl = @"api/sysUser/checkNum.json";
    [self makeRequestForType:ServiceType_api_verifySecurityCode params:param method:@"POST" userInfo:nil suffixUrl:suffixUrl];
}

- (void)resetPasswordWithLoginName:(NSString *)loginName password:(NSString *)password returnKey:(NSString *)returnKey type:(NSInteger)type completeBlock:(ResetPasswordCompleteBlock)completeBlock {
    self.resetPasswordBlock = completeBlock;
    NSDictionary *param = [HttpRequestParam paramResetPasswordWithLoginName:loginName password:password returnKey:returnKey type:type];
    NSString *suffixUrl = @"api/sysUser/update/password.json";
    [self makeRequestForType:    ServiceType_api_resetPassword params:param method:@"POST" userInfo:nil suffixUrl:suffixUrl];
}

#pragma mark - 回调

// 失败回调
- (void)service:(WebServiceID *)serviceID sType:(WebServiceType)sType requestFailed:(NSError*)error userInfo:(NSDictionary*)userInfo{
    if (sType == ServiceType_api_login) {
        if (self.loginBlock) {
            self.loginBlock(error);
        }
    } else if (sType == ServiceType_api_register) {
        if (self.registerBlock) {
            self.registerBlock(error);
        }
    } else if (sType == ServiceType_api_sendCode) {
        if (self.sendCodeBlock) {
            self.sendCodeBlock(error,nil);
        }
    } else if (sType == ServiceType_api_verifySecurityCode) {
        if (self.verifySecurityCodeBlock) {
            self.verifySecurityCodeBlock(error,nil);
        }
    } else if (sType == ServiceType_api_resetPassword) {
        if (self.resetPasswordBlock) {
            self.resetPasswordBlock(error);
        }
    }
}

// 成功回调
- (void)service:(WebServiceID *)serviceID sType:(WebServiceType)sType callbackWithData:(NSDictionary *)dic userInfo:(NSDictionary*)userInfo{
    if (sType == ServiceType_api_login) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.loginBlock) {
                    self.loginBlock(nil);
                }
            });
        });
    } else if (sType == ServiceType_api_register) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.registerBlock) {
                    self.registerBlock(nil);
                }
            });
        });
    } else if (sType == ServiceType_api_sendCode) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSDictionary *dataDic = [dic safeObjectForKey:@"data"];
            NECForgetPasswordBean *bean = [[NECForgetPasswordBean alloc]initWithDic:dataDic];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.sendCodeBlock) {
                    self.sendCodeBlock(nil,bean);
                }
            });
        });
    } else if (sType == ServiceType_api_verifySecurityCode) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSDictionary *dataDic = [dic safeObjectForKey:@"data"];
            NSString *returnKey = [dataDic safeObjectForKey:@"returnKey"];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.verifySecurityCodeBlock) {
                    self.verifySecurityCodeBlock(nil,returnKey);
                }
            });
        });
    } else if (sType == ServiceType_api_resetPassword) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.resetPasswordBlock) {
                    self.resetPasswordBlock(nil);
                }
            });
        });
    }
}
@end
