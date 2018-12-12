//
//  NECLoginNet.h
//  Nec
//
//  Created by 甘明强 on 2018/11/27.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NECForgetPasswordBean.h"

typedef void(^LoginInCompleteBlock)(NSError *error);
typedef void(^RegisterCompleteBlock)(NSError *error);
typedef void(^SendCodeCompleteBlock)(NSError *error,NECForgetPasswordBean *bean);
typedef void(^VerifySecurityCodeCompleteBlock)(NSError *error,NSString *returnKey);
typedef void(^ResetPasswordCompleteBlock)(NSError *error);

@interface NECLoginNet : NSObject

// 登录请求
- (void)loginWithLoginName:(NSString *)loginName password:(NSString *)password deviceID:(NSString *)deviceID registrationID:(NSString *)registrationID platform:(NSString *)platform completeBlock:(LoginInCompleteBlock)completeBlock;

// 注册请求
- (void)registerWithidCard:(NSString *)idCard loginName:(NSString *)loginName password:(NSString *)password phone:(NSString *)phone userName:(NSString *)userName completeBlock:(RegisterCompleteBlock)completeBlock;

// 获取验证码
- (void)getSendCodeWithPhone:(NSString *)phone  completeBlock:(SendCodeCompleteBlock)completeBlock;

// 确认验证码
- (void)verifySecurityCodeWithCheckNum:(NSString *)checkNum key:(NSString *)key completeBlock:(VerifySecurityCodeCompleteBlock)completeBlock;

// 重置密码
- (void)resetPasswordWithLoginName:(NSString *)loginName password:(NSString *)password returnKey:(NSString *)returnKey type:(NSInteger)type completeBlock:(ResetPasswordCompleteBlock)completeBlock;
@end
