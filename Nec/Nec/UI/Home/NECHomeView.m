//
//  NECHomeView.m
//  Nec
//
//  Created by 甘明强 on 2018/11/22.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import "NECHomeView.h"

@implementation NECHomeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.title = @"首页";
    self.backgroundColor = [UIColor hexChangeFloat:__kSL_White_01];
}

@end
