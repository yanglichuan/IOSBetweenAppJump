//
//  AppDelegate.m
//  02-微博
//
//  Created by apple on 14-12-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
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
//    return YES;
//}

/**
 *  通过别的应用打开我们的应用时会来到这里
 *
 *  @param url               通过什么URL打开的
 *  @param sourceApplication 打开我们应用的sourceApplication
 */
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    // NSLog(@"%@", url.absoluteString);
    
    // 1.取出window的根控制器
    UINavigationController *rootNav = (UINavigationController *)self.window.rootViewController;
    
    // 首先回到根控制器
    [rootNav popToRootViewControllerAnimated:NO];
    
    // 2.取出MainViewController,使用主要控制器就可以跳转到另外两个控制器
    ViewController *vc = [rootNav.childViewControllers firstObject];
    
    // 3.给scheme赋值,将它传递到下一个界面,直到传递给login
    vc.url = url.absoluteString;
    
    if ([url.absoluteString rangeOfString:@"login"].length) { // 是通过登录跳转过来的
        // NSLog(@"登录跳转过来");
        // rootVc.view.backgroundColor = [UIColor greenColor];
        
        [vc performSegueWithIdentifier:@"login" sender:nil];
    } else if ([url.absoluteString rangeOfString:@"share"].length) { // 是通过分享跳转过来的
        // NSLog(@"分享跳转过来");
        // rootVc.view.backgroundColor = [UIColor blueColor];
        
        [vc performSegueWithIdentifier:@"share" sender:nil];
    }
    
    return YES;
}

@end
