//
//  ViewController.m
//  02-微博
//
//  Created by apple on 14-12-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 在哪里设置Scheme:项目->info->URL Types ->+
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"login"]) {
        LoginViewController *login = segue.destinationViewController;
        login.url = self.url;
    }
}

@end
