
//
//  MyChooseTool.m
//  MyWeibo
//
//  Created by mageric-mac on 16/4/19.
//  Copyright © 2016年 mageric-mac. All rights reserved.
//

#import "MyChooseTool.h"

#define MyVersionKey @"version"
#import "MyTabBarController.h"
#import "MyNewFeatureController.h"

@implementation MyChooseTool

+(void)chooseRootViewController:(UIWindow* )window
{
    // 1.获取当前的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    // 2.获取上一次的版本号
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:MyVersionKey];
    
//    MyTabBarController *tabBarVc = [[MyTabBarController alloc] init];
//    
//    // 设置窗口的根控制器
//    window.rootViewController = tabBarVc;
//    
     //v1.0
     //判断当前是否有新的版本
    if ([currentVersion isEqualToString:lastVersion]) { // 没有最新的版本号
        
        // 创建tabBarVc
        MyTabBarController *tabBarVc = [[MyTabBarController alloc] init];
        
        // 设置窗口的根控制器
        window.rootViewController = tabBarVc;
        
        
    }else{ // 有最新的版本号
        
        // 进入新特性界面
        // 如果有新特性，进入新特性界面
        MyNewFeatureController *vc = [[MyNewFeatureController alloc] init];
        
        window.rootViewController = vc;
        
        // 保持当前的版本，用偏好设置
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:MyVersionKey];
    }

}
@end
