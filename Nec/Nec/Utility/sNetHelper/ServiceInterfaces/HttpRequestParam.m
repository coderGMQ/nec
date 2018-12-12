//
//  ETRequestParam.m
//  SmartLife
//
//  Created by Potter on 2017/2/15.
//  Copyright © 2017年 Potter. All rights reserved.
//
#import "HttpRequestParam.h"
#import <CommonCrypto/CommonDigest.h>

@implementation HttpRequestParam

+ (NSDictionary*)param_api_base{
    NSDictionary * base_param = @{};
    return base_param;
}

// 登录
+ (NSDictionary *)paramLoginWithLoginName:(NSString *)loginName password:(NSString *)password deviceID:(NSString *)deviceID registrationID:(NSString *)registrationID platform:(NSString *)platform {
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithDictionary:[[self class] param_api_base]];
    [dic safeSetObject:loginName forKey:@"loginName"];
    [dic safeSetObject:password forKey:@"password"];
    [dic safeSetObject:deviceID forKey:@"deviceId"];
    [dic safeSetObject:registrationID forKey:@"registrationId"];
    [dic safeSetObject:platform forKey:@"platform"];
    return dic;
}

// 注册
+ (NSDictionary *)paramRegisterWithidCard:(NSString *)idCard loginName:(NSString *)loginName password:(NSString *)password phone:(NSString *)phone userName:(NSString *)userName {
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithDictionary:[[self class] param_api_base]];
    [dic safeSetObject:idCard forKey:@"idCard"];
    [dic safeSetObject:loginName forKey:@"loginName"];
    [dic safeSetObject:password forKey:@"password"];
    [dic safeSetObject:phone forKey:@"phone"];
    [dic safeSetObject:userName forKey:@"userName"];
    return dic;
}

// 发送验证码
+ (NSDictionary *)paramSendCodeForgetPasswordWithPhone:(NSString *)phoneNum {
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithDictionary:[[self class] param_api_base]];
    [dic safeSetObject:phoneNum forKey:@"loginName"];
    return dic;
}

// 确认验证码
+ (NSDictionary *)paramVerifySecurityCodeWithCheckNum:(NSString *)checkNum key:(NSString *)key {
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithDictionary:[[self class] param_api_base]];
    [dic safeSetObject:checkNum forKey:@"checkNum"];
    [dic safeSetObject:key forKey:@"key"];
    return dic;
}

// 重置密码
+ (NSDictionary *)paramResetPasswordWithLoginName:(NSString *)loginName password:(NSString *)password returnKey:(NSString *)returnKey type:(NSInteger)type {
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithDictionary:[[self class] param_api_base]];
    [dic safeSetObject:loginName forKey:@"loginName"];
    [dic safeSetObject:password forKey:@"password"];
    [dic safeSetObject:returnKey forKey:@"returnKey"];
    [dic safeSetObject:@(type) forKey:@"type"];
    return dic;
}
@end




