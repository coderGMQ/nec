//
//  NECFindPasswordViewController.m
//  Nec
//
//  Created by 甘明强 on 2018/12/6.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import "NECFindPasswordViewController.h"
#import "iToast.h"
#import "NECLoginNet.h"

@interface NECFindPasswordViewController ()
{
    IBOutlet UITextField *_phoneNumT;
    IBOutlet UITextField *_securityT;
    IBOutlet UIButton *_securityBtn;
    IBOutlet UITextField *_passwordT;
    IBOutlet UIButton *_submitBtn;
    NSTimer *_timer;
    NSInteger _timerCount;
}
@property (nonatomic, strong) NECLoginNet *request;
@property (nonatomic, strong)NECForgetPasswordBean *bean;
@end

@implementation NECFindPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
    self.title = @"忘记密码";
    _submitBtn.layer.cornerRadius = 3;
    _securityBtn.layer.cornerRadius = 3;
    _securityBtn.layer.borderWidth = 1;
    _securityBtn.layer.borderColor = [UIColor hexChangeFloat:__kSL_Line_01].CGColor;
}

- (IBAction)btnClick:(UIButton *)sender {
    if (_phoneNumT.text.length == 0 ) {
        [[[iToast makeText:@"请输入登录账号"] setGravity:iToastGravityCenter] show];
        return;
    }
    if (sender == _securityBtn) {
        [self getSendCode];
    } else if (sender == _submitBtn) {
        if (_securityT.text.length == 0 ) {
            [[[iToast makeText:@"请输入验证码"] setGravity:iToastGravityCenter] show];
            return;
        }
        if (_passwordT.text.length == 0 ) {
            [[[iToast makeText:@"请输入新密码"] setGravity:iToastGravityCenter] show];
            return;
        }
        // 确认验证码
        [self verifySecurityCode];
    }
}

// 获取验证码
- (void)getSendCode {
    [self.__contentView addPlaceholdWithData:[PlaceholdData dataWithType:PlaceholdLoading]];
    __weak typeof (self)weakSelf = self;
    [self.request getSendCodeWithPhone:_phoneNumT.text completeBlock:^(NSError *error, NECForgetPasswordBean *bean) {
        [weakSelf handleGetSendCodeWithError:error bean:bean];
    }];
}

- (void)handleGetSendCodeWithError:(NSError *)error bean:(NECForgetPasswordBean *)bean{
    _bean = bean;
    [self.__contentView removeAllPlaceholdWithAnimation:YES];
    if (!error) {
        _timerCount = 60;
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
        _securityBtn.enabled = NO;
    }
}

- (void)timeAction:(id)aTimer {
    _timerCount--;
    [_securityBtn setTitle:[NSString stringWithFormat:@"%zd%@",_timerCount,@"秒"] forState:UIControlStateNormal];
    if (_timerCount<=0) {
        _securityBtn.enabled = YES;
        [_securityBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_timer invalidate];
        _timer = nil;
    }
}

// 确认验证码
- (void)verifySecurityCode {
    __weak typeof (self)weakSelf = self;
    [self.request verifySecurityCodeWithCheckNum:_bean.code key:_bean.key completeBlock:^(NSError *error, NSString *returnKey) {
        [weakSelf handleVerifySecurityCodeWithError:error returnKey:returnKey];
    }];
}

- (void)handleVerifySecurityCodeWithError:(NSError *)error returnKey:(NSString *)returnKey {
    if (!error) {
        // 重置密码
        [self resetPasswordWithReturnKey:returnKey];
    }
}

// 重置密码
- (void)resetPasswordWithReturnKey:(NSString *)returnKey{
    [self.__contentView addPlaceholdWithData:[PlaceholdData dataWithType:PlaceholdLoading]];
    __weak typeof (self)weakSelf = self;
    [self.request resetPasswordWithLoginName:_phoneNumT.text password:_passwordT.text returnKey:returnKey type:2 completeBlock:^(NSError *error) {
        [weakSelf handleResetPasswordWithError:error];
    }];
}

- (void)handleResetPasswordWithError:(NSError *)error {
    [self.__contentView removeAllPlaceholdWithAnimation:YES];
    if (!error) {
        [self.navigationController popViewControllerAnimated:YES];
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
