//
//  ViewController.m
//  01-新闻
//
//  Created by apple on 15/1/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

/*
 URL:统一资源定位符 http://www.baidu.com tel://110 file:///apple/Desktop/
 协议头Scheme:http:// tel:// file://
 资源路径path:www.baidu.com 110 /apple/Desktop/
 
 项目->info->url types ->+ -> 配置协议头
 */

#import "ViewController.h"

@interface ViewController ()

/**
 *  点击之后跳转到微信
 */
- (IBAction)jump;
/**
 *  点击微信好友按钮跳转到微信
 */
- (IBAction)sesstion;
/**
 *  点击朋友圈按钮跳转到微信
 */
- (IBAction)timeline;

@end

@implementation ViewController

- (IBAction)jump {
    [self openWeiXin:@"weixin://"];
}

- (IBAction)sesstion {
    [self openWeiXin:@"weixin://session?news"];
}

- (IBAction)timeline {
    [self openWeiXin:@"weixin://timeline"];
}

- (void)openWeiXin:(NSString *)urlStr
{
    // 1.创建要打开的App的URL
    NSURL *weixinURL = [NSURL URLWithString:urlStr];
    
    // 2.判断是否该URL可以打开
    if ([[UIApplication sharedApplication] canOpenURL:weixinURL]) {
        
        // 3.打开URL
        [[UIApplication sharedApplication] openURL:weixinURL];
    }
}

@end
