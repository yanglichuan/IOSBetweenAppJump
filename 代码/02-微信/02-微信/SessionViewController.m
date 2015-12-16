//
//  SessionViewController.m
//  02-微信
//
//  Created by apple on 15/1/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "SessionViewController.h"

@interface SessionViewController ()

/**
 *  返回到跳转过来的APP
 */
- (IBAction)backToApp;

@end

@implementation SessionViewController

- (IBAction)backToApp {
    NSRange range = [self.appURLStr rangeOfString:@"?"];
    NSString *appStr = [self.appURLStr substringFromIndex:(range.location + 1)];
    
    NSString *appURL = [NSString stringWithFormat:@"%@://", appStr];
    
    NSURL *url = [NSURL URLWithString:appURL];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}
@end
