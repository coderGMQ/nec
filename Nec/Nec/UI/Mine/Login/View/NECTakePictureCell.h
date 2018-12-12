//
//  NECTakePictureCell.h
//  Nec
//
//  Created by 甘明强 on 2018/12/4.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NECRegisterCompanyBean.h"

@interface NECTakePictureCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *takePictureImageView;
- (void)setDataWithBean:(NECRegisterBean *)bean;
@end
