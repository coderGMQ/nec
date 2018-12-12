//
//  NECTitleTextFieldCell.h
//  Nec
//
//  Created by 甘明强 on 2018/11/30.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NECRegisterCompanyBean.h"

@class NECTitleTextFieldCell;

@protocol NECTitleTextFieldCellDelegate <NSObject>
- (void)didClickTextFieldWithbean:(NECRegisterBean *)bean text:(NSString *)text tableViewCell:(NECTitleTextFieldCell *)cell;
@end

@interface NECTitleTextFieldCell : UITableViewCell
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, copy) void(^valueDidChangeBlock)(NSString *value);
@property (nonatomic, weak) id<NECTitleTextFieldCellDelegate>delegate;
+ (CGFloat)cellHeight;// 返回cell的高度
- (void)setDataWithBean:(NECRegisterBean *)bean;
@end
