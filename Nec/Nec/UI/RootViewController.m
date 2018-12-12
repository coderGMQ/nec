//
//  RootViewController.m
//  Nec
//
//  Created by 甘明强 on 2018/11/22.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import "RootViewController.h"
#import "NECHomeView.h"
#import "NECOrderView.h"
#import "NECMessageView.h"
#import "NECMineView.h"
#import "NECLoginViewController.h"
#import "MLNavigationController.h"

@interface RootViewController ()<TabbarViewDelegate>
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) NECHomeView *homeView;
@property (nonatomic, strong) NECOrderView *orderView;
@property (nonatomic, strong) NECMessageView *messageView;
@property (nonatomic, strong) NECMineView *mineView;
@property (nonatomic, strong) TabbarView *tabbarView;
@end

@implementation RootViewController

- (BOOL)needFullScreen {
    return YES;
}

- (BOOL)needBackButton {
    return NO;
}

- (BOOL)needNavigation {
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
    NECLoginViewController *vc = [[NECLoginViewController alloc] init];
    MLNavigationController *navigationController = [[MLNavigationController alloc] initWithRootViewController:vc];
    navigationController.navigationBarHidden = YES;
    [self presentViewController:navigationController animated:NO completion:nil];
}

- (void)initUI {
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, __gScreenWidth, __gScreenHeight+__gStatusBarHeight-__gBottomSafeHeight-50)];
    [self showContentViewWithType:TabbarHome enterType:TabbarEnterClick];
    [self.__contentView addSubview:_contentView];
    
    TabbarBean *homeBean = [[TabbarBean alloc] initWithIcon:@"tab_button_home_normal" slectIcon:@"tab_button_home_selected" title:@"首页" type:TabbarHome];
    TabbarBean *orderBean = [[TabbarBean alloc] initWithIcon:@"tab_button_order_normal" slectIcon:@"tab_button_order_selected" title:@"下单" type:TabbarOrder];
    TabbarBean *messageBean = [[TabbarBean alloc] initWithIcon:@"tab_button_message_normal" slectIcon:@"tab_button_message_selected" title:@"消息" type:TabbarMessage];
     TabbarBean *mineBean = [[TabbarBean alloc] initWithIcon:@"tab_button_mine_normal" slectIcon:@"tab_button_mine_selected" title:@"我的" type:TabbarMine];
    NSArray *dataSource = @[homeBean, orderBean, messageBean, mineBean];
    _tabbarView = [[TabbarView alloc] initWithFrame:CGRectMake(0, __gScreenHeight+ __gStatusBarHeight-__gBottomSafeHeight - 50, __gScreenWidth, 50) dataArray:dataSource];
    _tabbarView.delegate = self;
    _tabbarView.backgroundColor = [UIColor hexChangeFloat:__kSL_White_01];
    [self.__contentView addSubview:_tabbarView];
}

- (void)showContentViewWithType:(TabbarType)type enterType:(TabbarEnterType)enterType {
    switch (type) {
        case TabbarHome: {// 首页
            if (self.homeView) {
                self.homeView.hidden = NO;
                [self.contentView bringSubviewToFront:self.homeView];
            } else {
                self.homeView = [[NECHomeView alloc] initWithFrame:self.contentView.bounds];
                //                self.homeView.rootViewController = self;
                [self.contentView addSubview:self.homeView];
            }
            break;
        }
        case TabbarOrder: {// 下单
            if (self.orderView) {
                self.orderView.hidden = NO;
                [self.contentView bringSubviewToFront:self.orderView];
            } else {
                self.orderView = [[NECOrderView alloc] initWithFrame:self.contentView.bounds];
                //                self.familyView.rootViewController = self;
                [self.contentView addSubview:self.orderView];
            }
            break;
        }
        case TabbarMessage: {// 消息
            if (self.messageView) {
                self.messageView.hidden = NO;
                [self.contentView bringSubviewToFront:self.messageView];
            } else {
                self.messageView = [[NECMessageView alloc] initWithFrame:self.contentView.bounds];
                //                self.serviceView.rootViewController = self;
                [self.contentView addSubview:self.messageView];
            }
            break;
        }
        case TabbarMine: {// 我的
            if (self.mineView) {
                self.mineView.hidden = NO;
                [self.contentView bringSubviewToFront:self.mineView];
            } else {
                self.mineView = [[NECMineView alloc] initWithFrame:self.contentView.bounds];
                //                self.mineView.rootViewController = self;
                [self.contentView addSubview:self.mineView];
            }
            break;
        }
        default:
            break;
    }
    //    [self refreshStatusBar];
    //    [self refreshUI];
}


#pragma mark - TabbarViewDelegate

- (void)didClickItemWithType:(TabbarType)type enterType:(TabbarEnterType)enterType {
    [self showContentViewWithType:type enterType:enterType];
}
@end
