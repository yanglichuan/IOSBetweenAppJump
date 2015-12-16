//
//  ViewController.m
//  01-新闻
//
//  Created by apple on 14-12-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

// URL:协议头://路径
// 协议头:Scheme 比如:http/ftp/file/tel http://www.baidu.com
// 路径:www.baidu.com

#import "ViewController.h"

@interface ViewController ()

/**
 *  登录
 */
- (IBAction)login;
/**
 *  分享
 */
- (IBAction)share;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)login {
    [self openURL:@"weibo://login?news"];
}

- (IBAction)share {
    [self openURL:@"weibo://share"];
}

- (void)openURL:(NSString *)url
{
    // 1.利用UIApplication可以打开另外一个应用
    UIApplication *app = [UIApplication sharedApplication];
    
    // 2.获取另外一个应用的URL
    NSURL *weiboURL = [NSURL URLWithString:url];
    
    // 3.判断是否可以打开
    if ([app canOpenURL:weiboURL]) {
        // 打开另外一个应用
        [app openURL:weiboURL];
    }
}

@end
