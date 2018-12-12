//
//  NECSelectCardTypeCell.m
//  Nec
//
//  Created by 甘明强 on 2018/12/3.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import "NECSelectCardTypeCell.h"

@interface NECSelectCardTypeCell ()
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;
@property (retain, nonatomic) IBOutlet UIButton *threeCardBtn;
@property (retain, nonatomic) IBOutlet UIButton *threeCardAllBtn;
@property (nonatomic, strong) NECRegisterBean *bean;
@end

@implementation NECSelectCardTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _threeCardBtn.selected = YES;
    _threeCardBtn.tag = NECRegisterSelectCardThreeCardItem + _necRegisterSelectCardBaseTag;
    _threeCardAllBtn.tag = NECRegisterSelectCardThreeAllCardItem +_necRegisterSelectCardBaseTag;
}

- (IBAction)btnClick:(UIButton *)btn {
    //Mine_register_selected Mine_register_normal
    if (btn == _threeCardBtn) {
        _threeCardBtn.selected = YES;
        _threeCardAllBtn.selected = NO;
    } else if (btn == _threeCardAllBtn) {
        _threeCardAllBtn.selected = YES;
        _threeCardBtn.selected = NO;
    }
  
    if (_delegate && [_delegate respondsToSelector:@selector(didClickItemWithIndex:)]) {
        [_delegate didClickItemWithIndex:btn.tag];
    }
}

- (void)setDataWithBean:(NECRegisterBean *)bean {
    _bean = bean;
    _titleLabel.text = bean.title;
}
@end
