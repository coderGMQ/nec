//
//  NECLoginBean.h
//  Nec
//
//  Created by 甘明强 on 2018/11/27.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NECLoginBean : NSObject

@property (nonatomic, strong) NSString *idCard;
@property (nonatomic, strong) NSString *companyName;
@property (nonatomic, assign) NSInteger examineStatus;
@property (nonatomic, strong) NSString *weiXin;
@property (nonatomic, assign) NSInteger isUpdateWaybill;
@property (nonatomic, strong) NSString *documentPositive;
@property (nonatomic, strong) NSString *documentOther;
@property (nonatomic, strong) NSString *loginName;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, strong) NSString *staffNo;
@property (nonatomic, strong) NSString *deptId;
@property (nonatomic, assign) NSInteger isSeePrice;
@property (nonatomic, strong) NSString *companySize;
@property (nonatomic, strong) NSString *taxCode;
@property (nonatomic, strong) NSString *weiBo;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *orgDocumentTyep;
@property (nonatomic, strong) NSString *organizationCode;
@property (nonatomic, strong) NSString *documentTime;
@property (nonatomic, strong) NSString *userType;
@property (nonatomic, strong) NSString *position;
@property (nonatomic, assign) BOOL status;
@property (nonatomic, strong) NSString *documentType;
@property (nonatomic, strong) NSString *priPhone;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, strong) NSString *orgAddress;
@property (nonatomic, strong) NSString *orgNick;
@property (nonatomic, strong) NSString *idNumber;
@property (nonatomic, strong) NSString *orgId;
@property (nonatomic, strong) NSString *principal;
@property (nonatomic, strong) NSString *creditCode;
@property (nonatomic, strong) NSString *updateBy;
@property (nonatomic, strong) NSString *orgCode;
@property (nonatomic, strong) NSString *legalPerson;
@property (nonatomic, strong) NSString *companyNature;
@property (nonatomic, strong) NSString *licenseCod;
@property (nonatomic, strong) NSString *authenticationStatus;
@property (nonatomic, strong) NSString *authentication;
@property (nonatomic, strong) NSString *birthDay;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *wxAccount;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, strong) NSString *updateTime;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *alipayAccount;
@property (nonatomic, strong) NSString *parentId;
@property (nonatomic, strong) NSString *orgPhone;
@property (nonatomic, strong) NSString *createBy;
@property (nonatomic, strong) NSString *orgEmail;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *companyIndustry;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
