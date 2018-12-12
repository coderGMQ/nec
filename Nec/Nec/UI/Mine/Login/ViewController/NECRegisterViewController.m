//
//  NECRegisterViewController.m
//  Nec
//
//  Created by 甘明强 on 2018/11/29.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import "NECRegisterViewController.h"
#import "NECRegisterPersonViewController.h"
#import "NECRegisterCompanyViewController.h"

@interface NECRegisterViewController ()
{
    UIButton *_personRegisterBtn;
    UIButton *_companyRegisterBtn;
}
@end

@implementation NECRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (ETBannerButtonType)backBtuttonType {
    return ETBannerButtonWhite;
}

- (void)initUI {
    self.title = @"注册";
    self.__titleLabel.textColor = [UIColor hexChangeFloat:__kSL_White_01];
    self.__navigationView.backgroundColor = [UIColor hexChangeFloat:__kSL_Blue_01];
    
    _personRegisterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_personRegisterBtn setTitle:@"个人注册" forState:UIControlStateNormal];
    [_personRegisterBtn setTitleColor:[UIColor hexChangeFloat:__kSL_Blue_01] forState:UIControlStateNormal];
    [_personRegisterBtn setImage:[UIImage imageNamed:@"Mine_register_person"] forState:UIControlStateNormal];
    _personRegisterBtn.layer.cornerRadius = 4;
    _personRegisterBtn.layer.borderWidth= 1;
    _personRegisterBtn.layer.borderColor = [UIColor hexChangeFloat:__kSL_Blue_01].CGColor;
    [_personRegisterBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.__contentView addSubview:_personRegisterBtn];
    [_personRegisterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.top.mas_equalTo(60);
        make.height.mas_equalTo(50);
    }];
    
    _companyRegisterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_companyRegisterBtn setTitle:@"企业注册" forState:UIControlStateNormal];
    [_companyRegisterBtn setTitleColor:[UIColor hexChangeFloat:__kSL_Blue_01] forState:UIControlStateNormal];
    [_companyRegisterBtn setImage:[UIImage imageNamed:@"Mine_register_company"] forState:UIControlStateNormal];
    _companyRegisterBtn.layer.cornerRadius = 4;
    _companyRegisterBtn.layer.borderWidth= 1;
    _companyRegisterBtn.layer.borderColor = [UIColor hexChangeFloat:__kSL_Blue_01].CGColor;
    [_companyRegisterBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.__contentView addSubview:_companyRegisterBtn];
    [_companyRegisterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.top.mas_equalTo(_personRegisterBtn.mas_bottom).offset(20);
        make.height.mas_equalTo(50);
    }];
}

- (void)btnClick:(UIButton *)btn {
    if (btn == _personRegisterBtn) {
        NECRegisterPersonViewController *vc = [[NECRegisterPersonViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (btn == _companyRegisterBtn) {
        NECRegisterCompanyViewController *vc = [[NECRegisterCompanyViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
