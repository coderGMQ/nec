//
//  NECForgetPasswordBean.h
//  Nec
//
//  Created by 甘明强 on 2018/12/6.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NECForgetPasswordBean : NSObject
@property (nonatomic, strong) NSString *code;// 验证码
@property (nonatomic, strong) NSString *key;// key值
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
