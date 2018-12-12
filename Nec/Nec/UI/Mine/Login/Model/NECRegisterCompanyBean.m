//
//  NECRegisterCompanyBean.m
//  Nec
//
//  Created by 甘明强 on 2018/11/30.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import "NECRegisterCompanyBean.h"

@implementation NECRegisterCompanyBean
- (instancetype)initDataWithDicArray:(NSArray *)dicArray {
    self = [super init];
    if (self) {
        NSArray *array = [NSArray arrayWithArray:dicArray];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            NECRegisterBean *bean = [[NECRegisterBean alloc]initWithDic:dic];
            [temp addObject:bean];
        }
        self.dicArray = [NSArray arrayWithArray:temp];
    }
    return self;
}

@end

@implementation NECRegisterBean
- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.title = [dic safeObjectForKey:@"title"];
        self.placeholder = [dic safeObjectForKey:@"placeholder"];
        self.cellType = [[dic safeObjectForKey:@"cellType"] integerValue];
    }
    return self;
}
@end

