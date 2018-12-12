//
//  NECRegisterCompanyBean.h
//  Nec
//
//  Created by 甘明强 on 2018/11/30.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

typedef NS_ENUM(NSUInteger, NECRegisterCellType) {
    NECRegisterCellTypePlaceholder,  // 后面是textField
    NECRegisterCellTypeCustomView,   // 后面是自定义控件
    NECRegisterCellTypeImage,        // 后面是图片选择器
};

#import <Foundation/Foundation.h>

@interface NECRegisterCompanyBean : NSObject
@property (nonatomic, strong) NSArray *dicArray;
- (instancetype)initDataWithDicArray:(NSArray *)dicArray;
@end

@interface NECRegisterBean : NSObject
@property (strong, nonatomic) NSString *title;// 标题
@property (strong, nonatomic) NSString *placeholder;// 占位文字
@property (assign, nonatomic) NECRegisterCellType cellType;//
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
