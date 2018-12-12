//
//  ETRequestParam.h
//  SmartLife
//
//  Created by Potter on 2017/2/15.
//  Copyright © 2017年 Potter. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>
#import <UIKit/UIKit.h>

@interface HttpRequestParam : NSObject

// 基本param
+ (NSDictionary*)param_api_base;
// 登录
+ (NSDictionary *)paramLoginWithLoginName:(NSString *)loginName password:(NSString *)password deviceID:(NSString *)deviceID registrationID:(NSString *)registrationID platform:(NSString *)platform;
// 注册
+ (NSDictionary *)paramRegisterWithidCard:(NSString *)idCard loginName:(NSString *)loginName password:(NSString *)password phone:(NSString *)phone userName:(NSString *)userName;
// 发送验证码
+ (NSDictionary *)paramSendCodeForgetPasswordWithPhone:(NSString *)phoneNum;
// 确认验证码
+ (NSDictionary *)paramVerifySecurityCodeWithCheckNum:(NSString *)checkNum key:(NSString *)key;
// 重置密码
+ (NSDictionary *)paramResetPasswordWithLoginName:(NSString *)loginName password:(NSString *)password returnKey:(NSString *)returnKey type:(NSInteger)type;

@end


@interface HttpRequestParam (Other)

@end


@interface HttpRequestParam (forum)

@end






