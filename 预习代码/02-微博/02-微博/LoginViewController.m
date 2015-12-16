//
//  LoginViewController.m
//  02-微博
//
//  Created by apple on 14-12-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

- (IBAction)backToApp;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)backToApp {
    // 截取字符串,拿到scheme
    NSInteger location = [self.url rangeOfString:@"?"].location;
    NSString *scheme = [self.url substringFromIndex:location + 1];

    // 通过scheme返回新闻
    NSString *news = [NSString stringWithFormat:@"%@://accesstoken=xxxx&userID=xxxx", scheme];
    NSURL *newsUrl = [NSURL URLWithString:news];
    if ([[UIApplication sharedApplication] canOpenURL:newsUrl]) {
        [[UIApplication sharedApplication] openURL:newsUrl];
    }
}
@end
