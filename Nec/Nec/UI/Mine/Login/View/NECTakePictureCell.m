//
//  NECTakePictureCell.m
//  Nec
//
//  Created by 甘明强 on 2018/12/4.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import "NECTakePictureCell.h"

@interface NECTakePictureCell ()
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) NECRegisterBean *bean;
@end

@implementation NECTakePictureCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setDataWithBean:(NECRegisterBean *)bean {
    _bean = bean;
    _titleLabel.text = bean.title;
}
@end
