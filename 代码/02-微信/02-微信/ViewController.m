//
//  ViewController.m
//  02-微信
//
//  Created by apple on 15/1/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "SessionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"session"]) {
        SessionViewController *sessionVc = segue.destinationViewController;
        sessionVc.appURLStr = self.appURLStr;
    }
}

@end
