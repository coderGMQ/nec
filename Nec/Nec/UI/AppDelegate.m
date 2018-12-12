//
//  AppDelegate.m
//  Nec
//
//  Created by 甘明强 on 2018/11/21.
//  Copyright © 2018年 com.zhihundaohe.WLDS. All rights reserved.
//

#import "AppDelegate.h"
#import "MLNavigationController.h"
#import "UIDeviceInfo.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 初始化全局变量
    [self initGlobalVariable];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MLNavigationController *navigationController = [self getRootNavigationController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (MLNavigationController *)getRootNavigationController {
    _rootViewController = [[RootViewController alloc]init];
    MLNavigationController *navigationController = [[MLNavigationController alloc]initWithRootViewController:_rootViewController];
    navigationController.navigationBarHidden = YES;
    return navigationController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}


- (void)initGlobalVariable {
    //全局高度，宽度
    if ([UIDeviceInfo isiPhoneX]) {
        __gStatusBarHeight = 44;
        __gBottomSafeHeight = 54;
    } else {
        __gStatusBarHeight = 20;
        __gBottomSafeHeight = 0;
    }
    
    __gScreenHeight = [UIScreen mainScreen].bounds.size.height-20;
    __gScreenWidth = [UIScreen mainScreen].bounds.size.width;
    __gWidthRatio = __gScreenWidth / 375.f;
    __gNavigationHeight = 44.f;
    __gSystemVersion = [[UIDevice currentDevice].systemVersion floatValue];
    __gStyleColor = __kSL_White_01;
}

@end
