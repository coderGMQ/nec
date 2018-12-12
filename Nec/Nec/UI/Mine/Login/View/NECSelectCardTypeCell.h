//
//  NECSelectCardTypeCell.h
//  Nec
//
//  Created by 甘明强 on 2018/12/3.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NECRegisterCompanyBean.h"

static NSInteger const _necRegisterSelectCardBaseTag = 100;

typedef NS_ENUM(NSUInteger, NECRegisterSelectCardItem) {
    NECRegisterSelectCardThreeCardItem,// 三证按钮
    NECRegisterSelectCardThreeAllCardItem,// 三证合一按钮
};

@protocol NECSelectCardTypeCellDelegate <NSObject>
- (void)didClickItemWithIndex:(NSInteger)index;
@end


@interface NECSelectCardTypeCell : UITableViewCell
@property (nonatomic, weak) id<NECSelectCardTypeCellDelegate>delegate;
- (void)setDataWithBean:(NECRegisterBean *)bean;
@end
