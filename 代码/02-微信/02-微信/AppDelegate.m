//
//  AppDelegate.m
//  02-微信
//
//  Created by apple on 15/1/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
//{
//    
//}

/**
 *  当通过别应用打开该应用的时候会执行该方法
 *
 *  @param url               通过哪一个URL跳转过来的
 */
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    // 取出来根控制器
    UINavigationController *rootNav = (UINavigationController *)self.window.rootViewController;
    
    [rootNav popToRootViewControllerAnimated:NO];
    
    // 取出ViewController
    ViewController *mainVc = [rootNav.childViewControllers firstObject];
    
    NSString *urlStr = url.absoluteString;
    if ([urlStr rangeOfString:@"session"].length) {
        
        mainVc.appURLStr = urlStr;
        
        // 跳转到微信好友界面
        [mainVc performSegueWithIdentifier:@"session" sender:nil];
        
    } else if ([urlStr rangeOfString:@"timeline"].length){
        // 跳转到朋友圈界面
        [mainVc performSegueWithIdentifier:@"timeline" sender:nil];
    }
    
    return YES;
}

@end
