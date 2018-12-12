//
//  NECRegisterPersonViewController.m
//  Nec
//
//  Created by 甘明强 on 2018/11/29.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import "NECRegisterPersonViewController.h"
#import "iToast.h"
#import "NECLoginNet.h"

@interface NECRegisterPersonViewController ()
{
   __weak IBOutlet UITextField *_registerAccountT;
   __weak IBOutlet UITextField *_passwordT;
   __weak IBOutlet UITextField *_repeatPasswordT;
   __weak IBOutlet UITextField *_nameT;
   __weak IBOutlet UITextField *_idNumT;
    IBOutlet UITextField *_phoneNumT;
    
   __weak IBOutlet UIButton *_submitBtn;
}
@property (nonatomic, strong) NECLoginNet *request;
@end

@implementation NECRegisterPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (ETBannerButtonType)backBtuttonType {
    return ETBannerButtonWhite;
}

- (void)initUI {
    self.title = @"个人注册";
    self.__titleLabel.textColor = [UIColor hexChangeFloat:__kSL_White_01];
    self.__navigationView.backgroundColor = [UIColor hexChangeFloat:__kSL_Blue_01];
    _submitBtn.layer.cornerRadius = 3;
}

- (IBAction)btnClick:(id)sender {
    if (sender == _submitBtn) {
        if (_registerAccountT.text.length == 0) {
            [[[iToast makeText:@"请输入用户名"] setGravity:iToastGravityCenter] show];
            return;
        }
        if (_passwordT.text.length == 0) {
            [[[iToast makeText:@"请输入密码"] setGravity:iToastGravityCenter] show];
            return;
        }
        if (![_repeatPasswordT.text isEqualToString:_passwordT.text]) {
            [[[iToast makeText:@"请确认输入密码和确认密码一致"] setGravity:iToastGravityCenter] show];
            return;
        }
        if (_nameT.text.length == 0) {
            [[[iToast makeText:@"请输入姓名"] setGravity:iToastGravityCenter] show];
            return;
        }
        if (_idNumT.text.length == 0) {
            [[[iToast makeText:@"请输入18位身份证号"] setGravity:iToastGravityCenter] show];
            return;
        }
        if (_phoneNumT.text.length == 0) {
            [[[iToast makeText:@"请输入手机号"] setGravity:iToastGravityCenter] show];
            return;
        }
        [self registerRequest];
    }
}

// 注册请求
- (void)registerRequest {
    __weak typeof (self)weakSelf = self;
    [self.request registerWithidCard:_idNumT.text loginName:_registerAccountT.text password:_passwordT.text phone:_phoneNumT.text userName:_nameT.text completeBlock:^(NSError *error) {
        [weakSelf handleRegisterWithError:error];
    }];
}

- (void)handleRegisterWithError:(NSError *)error {
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
