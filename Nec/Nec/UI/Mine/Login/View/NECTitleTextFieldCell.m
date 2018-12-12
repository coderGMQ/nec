//
//  NECTitleTextFieldCell.m
//  Nec
//
//  Created by 甘明强 on 2018/11/30.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import "NECTitleTextFieldCell.h"

@interface NECTitleTextFieldCell ()<UITextFieldDelegate>
{
    UILabel *_titleLabel;
}
@property (nonatomic, strong) NECRegisterBean *bean;
@end

@implementation NECTitleTextFieldCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)initUI {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:__kSL_Text_18];
        _titleLabel.textColor = [UIColor hexChangeFloat:__kSL_Black_01];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.mas_equalTo(10);
        }];
    }
    
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.backgroundColor = [UIColor clearColor];
        _textField.font = [UIFont systemFontOfSize:__kSL_Text_13];
        _textField.textColor = [UIColor blackColor];
        _textField.placeholderColor = [UIColor hexChangeFloat:__kSL_Black_03];
        _textField.textAlignment = NSTextAlignmentRight;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.delegate = self;
        [_textField addTarget:self action:@selector(didClicktextField:) forControlEvents:UIControlEventEditingChanged];
        [self.contentView addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(0);
            make.width.mas_equalTo(200);
        }];
    }
}

- (void)textFieldDidChange:(UITextField *)textField{
    if (textField == _textField) {
        if (self.valueDidChangeBlock) {
            self.valueDidChangeBlock(textField.text);
        }
    }
}

+ (CGFloat)cellHeight{
    return 44.0;
}

- (void)setDataWithBean:(NECRegisterBean *)bean {
    _bean = bean;
    _titleLabel.text = bean.title;
    _textField.placeholder = bean.placeholder;
}

#pragma mark - UITextFieldDelegate

- (void)didClicktextField:(UITextField *)textField {
    if (_delegate && [_delegate respondsToSelector:@selector(didClickTextFieldWithbean:textField:tableViewCell:)]){
        [_delegate didClickTextFieldWithbean:self.bean textField:textField tableViewCell:self];
    }

}
@end
