//
//  NECLoginViewController.m
//  Nec
//
//  Created by 甘明强 on 2018/11/23.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import "NECLoginViewController.h"
#import "SLBtnHelper.h"
#import "iToast.h"
#import "NECLoginNet.h"
#import "UIDeviceInfo.h"
#import "NECRegisterViewController.h"
#import "NECFindPasswordViewController.h"

@interface NECLoginViewController ()
{
    __weak IBOutlet UITextField *_phoneNumT;
    __weak IBOutlet UITextField *_passwordT;
    __weak IBOutlet UIButton *_moreBtn;
    __weak IBOutlet UIButton *_changeBtn;
    __weak IBOutlet UIButton *_loginBtn;
    __weak IBOutlet UIButton *_forgetPasswordBtn;
    UIButton *_registerBtn;
}
@property (nonatomic, strong) NECLoginNet *request;
@end

@implementation NECLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (ETBannerButtonType)backBtuttonType {
    return ETBannerButtonWhite;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //退出键盘
    [self.view endEditing:YES];
}

- (void)initUI {
    self.title = @"登录";
    self.__titleLabel.textColor = [UIColor hexChangeFloat:__kSL_White_01];
    self.__navigationView.backgroundColor = [UIColor hexChangeFloat:__kSL_Blue_01];
    
    _loginBtn.layer.cornerRadius = 3;
    
    // 注册按钮
    _registerBtn = [SLBtnHelper rightNavBtnWithTitle:@"注册"];
    [_registerBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.__navigationView.contentView addSubview:_registerBtn];
}

#pragma mark - btnClick
- (IBAction)btnClick:(UIButton *)sender {
    if (sender == _moreBtn) {
        
    } else if (sender == _changeBtn) {
        
    } else if (sender == _loginBtn) {
        if (_phoneNumT.text.length == 0) {
            [[[iToast makeText:@"请输入用户名"] setGravity:iToastGravityCenter] show];
            return;
        }
        if (_passwordT.text.length == 0) {
            [[[iToast makeText:@"请输入密码"] setGravity:iToastGravityCenter] show];
            return;
        }
        //登录请求
        [self getLoginRequest];
    } else if (sender == _forgetPasswordBtn) {
        NECFindPasswordViewController *vc = [[NECFindPasswordViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)registerBtnClick:(UIButton *)btn {
    if (btn == _registerBtn) {
        NECRegisterViewController *vc = [[NECRegisterViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)getLoginRequest{
    NSString *deviceID = [UIDeviceInfo UDID];
    __weak typeof (self)weakSelf = self;
    [self.__contentView addPlaceholdWithData:[PlaceholdData dataWithType:PlaceholdLoading]];
    [self.request loginWithLoginName:_phoneNumT.text password:_passwordT.text deviceID:deviceID registrationID:@"1114a8979284d103e72" platform:@"ios" completeBlock:^(NSError *error) {
        [weakSelf handleLoginInWithError:error];
    }];
}

- (void)handleLoginInWithError:(NSError *)error {
    [self.__contentView removeAllPlaceholdWithAnimation:YES];
    if (!error) {
    }
}

#pragma mark - get method

- (NECLoginNet *)request {
    if (!_request) {
        _request = [[NECLoginNet alloc]init];
    }
    return _request;
}
@end
