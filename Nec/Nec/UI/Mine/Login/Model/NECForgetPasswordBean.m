//
//  NECForgetPasswordBean.m
//  Nec
//
//  Created by 甘明强 on 2018/12/6.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import "NECForgetPasswordBean.h"

@implementation NECForgetPasswordBean
- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.code = [dic safeObjectForKey:@"code"];
        self.key = [dic safeObjectForKey:@"key"];
    }
    return self;
}
@end
