//
//  NECRegisterCompanyViewController.m
//  Nec
//
//  Created by 甘明强 on 2018/11/30.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import "NECRegisterCompanyViewController.h"
#import "NECRegisterCompanyBean.h"
#import "NECTitleTextFieldCell.h"
#import "NECSelectCardTypeCell.h"
#import "NECTakePictureCell.h"

static NSString *const _necTitleTextFieldCell = @"NECTitleTextFieldCell";
static NSString *const _necSelectCardTypeCell = @"NECSelectCardTypeCell";
static NSString *const _necTakePictureCell = @"NECTakePictureCell";


@interface NECRegisterCompanyViewController ()<UITableViewDelegate,UITableViewDataSource,NECSelectCardTypeCellDelegate,NECTitleTextFieldCellDelegate>
{
    UITableView *_tableView;
    UIButton *_submitBtn;

    NSString *_orgName;// 公司名称
    NSString *_legalPerson;// 法人
    NSString *_licenseCode;// 营业执照注册号
    NSString *_organizationCode;// 组织机构代码
    NSString *_taxCode;// 税务登记证号
    NSString *_address;// 公司地址
    NSString *_orgPhone;// 公司电话
    NSString *_principal;// 联系人
    NSString *_phone;// 联系电话
    NSString *_eMail;// 联系邮箱
    NSString *_license;// 营业执照图片
    NSString *_organizationCodePic;// 组织机构图片
    NSString *_taxCodePic;// 税务登记证图片
}
@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic,strong) NSString *loginName;// 登录名
@property (nonatomic,strong) NSString *password;// 密码
@property (nonatomic,strong) NSString *surePassword;// 重复密码



@end

@implementation NECRegisterCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (ETBannerButtonType)backBtuttonType {
    return ETBannerButtonWhite;
}

- (void)initUI {
    self.title = @"企业注册";
    self.__titleLabel.textColor = [UIColor hexChangeFloat:__kSL_White_01];
    self.__navigationView.backgroundColor = [UIColor hexChangeFloat:__kSL_Blue_01];
    
    [self setUpThreeCardDataSource];
    
    _tableView = [[UITableView alloc] initWithFrame:self.__contentView.bounds style:UITableViewStyleGrouped];
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    _tableView.estimatedSectionFooterHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.backgroundColor = [UIColor hexChangeFloat:__kSL_Background];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[NECTitleTextFieldCell class] forCellReuseIdentifier:_necTitleTextFieldCell];
    [_tableView registerNib:[UINib nibWithNibName:@"NECSelectCardTypeCell" bundle:nil] forCellReuseIdentifier:_necSelectCardTypeCell];
    [_tableView registerNib:[UINib nibWithNibName:@"NECTakePictureCell" bundle:nil] forCellReuseIdentifier:_necTakePictureCell];
    [self.__contentView addSubview:_tableView];
    [self setUpTableViewFooterView];
}

- (void)setUpTableViewFooterView {
    UIView *footerView = [[UIView alloc]init];
    footerView.height = 100;
    footerView.backgroundColor = [UIColor hexChangeFloat:__kSL_Background];
    // 确认提交按钮
    _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_submitBtn setTitle:@"确认" forState:UIControlStateNormal];
    [_submitBtn setBackgroundColor:[UIColor hexChangeFloat:__kSL_Blue_01]];
    _submitBtn.titleLabel.font = [UIFont systemFontOfSize:__kSL_Text_18];
    _submitBtn.layer.cornerRadius = 3;
    [_submitBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:_submitBtn];
    [_submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(30);
        make.height.mas_equalTo(44);
    }];
    _tableView.tableFooterView = footerView;
}

#pragma mark - btnClick

- (void)btnClick:(UIButton *)btn {
    if (btn == _submitBtn) {
        NSLog(@" loginName    = %@ ",self.loginName);
        NSLog(@" password     = %@ ",self.password);
        NSLog(@" surePassword = %@ ",self.surePassword);
    }
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NECRegisterCompanyBean *registerCommonybean = [_dataSource safeObjectAtIndex:section];
    return registerCommonybean.dicArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NECRegisterCompanyBean *registerCommonybean = [_dataSource safeObjectAtIndex:indexPath.section];
    NECRegisterBean *bean = [registerCommonybean.dicArray safeObjectAtIndex:indexPath.row];
    if (bean.cellType == NECRegisterCellTypePlaceholder) {
        NECTitleTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:_necTitleTextFieldCell];
        cell.delegate = self;
        [cell setDataWithBean:bean];
        return cell;
    } else if (bean.cellType == NECRegisterCellTypeCustomView){
        NECSelectCardTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:_necSelectCardTypeCell];
        cell.delegate = self;
        [cell setDataWithBean:bean];
        return cell;
    }  else {
        NECTakePictureCell *cell = [tableView dequeueReusableCellWithIdentifier:_necTakePictureCell];
        [cell setDataWithBean:bean];
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 3) {
        UIView *textView = [[UIView alloc]init];
        UILabel *textLabel = [[UILabel alloc]init];
        textLabel.frame = CGRectMake(15, 0, __gScreenWidth - 15, 40);
        textLabel.text = @"证件图片";
        textLabel.textColor = [UIColor hexChangeFloat:__kSL_Black_01];
        textLabel.font = [UIFont systemFontOfSize:__kSL_Text_13];
        [textView addSubview:textLabel];
        return textView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 3) {
        return 40;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 3) {
        return 60;
    }
    return 45;
}

// 设置三证数据源
- (void)setUpThreeCardDataSource {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"registerCompanyNormal" ofType:@"plist"];
    self.dataSource = [NSMutableArray arrayWithContentsOfFile:path];
    NSMutableArray *temp = [NSMutableArray array];
    for (NSArray *dicArray in _dataSource) {
        NECRegisterCompanyBean *bean = [[NECRegisterCompanyBean alloc]initDataWithDicArray:dicArray];
        [temp addObject:bean];
    }
    self.dataSource = [NSArray arrayWithArray:temp];
    [_tableView reloadData];
}

// 设置三证合一数据源
- (void)setUpThreeCardAllDataSource {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"registerCompanyOther" ofType:@"plist"];
    self.dataSource = [NSMutableArray arrayWithContentsOfFile:path];
    NSMutableArray *temp = [NSMutableArray array];
    for (NSArray *dicArray in _dataSource) {
        NECRegisterCompanyBean *bean = [[NECRegisterCompanyBean alloc]initDataWithDicArray:dicArray];
        [temp addObject:bean];
    }
    self.dataSource = [NSArray arrayWithArray:temp];
    [_tableView reloadData];
}

#pragma mark - NECTitleTextFieldCellDelegate

- (void)didClickTextFieldWithbean:(NECRegisterBean *)bean text:(NSString *)text tableViewCell:(NECTitleTextFieldCell *)cell{
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    NSLog(@"-------------%@",text);
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            self.loginName = text;
        } else if (indexPath.row == 1) {
            self.password = text;
        } else if (indexPath.row == 2){
            self.surePassword = text;
        } else {
            
        }
    } else {
        
    }
}

#pragma mark - NECSelectCardTypeCellDelegate

- (void)didClickItemWithIndex:(NSInteger)index {
    if (index == NECRegisterSelectCardThreeCardItem + _necRegisterSelectCardBaseTag) {// 点击三证按钮
        [self setUpThreeCardDataSource];
    } else if (index == NECRegisterSelectCardThreeAllCardItem +_necRegisterSelectCardBaseTag) {// 点击三证合一按钮
        [self setUpThreeCardAllDataSource];
    }
}
@end
