//
//  MainViewController.m
//  彩票推荐
//
//  Created by apple on 15-1-7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "MainViewController.h"
#import "ProjectModel.h"
#import "ViewController.h"

#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

@interface MainViewController ()
{
    NSArray *_projectData;
}
@end

@implementation MainViewController

+ (void)initialize
{
    // 1.取出设置主题的对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    
    // 2.设置导航栏的背景图片
    NSString *navBarBg = @"NavBar64";
        
    // 设置导航栏的渐变色为白色（iOS7中返回箭头的颜色变为这个颜色：白色）
    navBar.tintColor = [UIColor whiteColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [navBar setBackgroundImage:[UIImage imageNamed:navBarBg] forBarMetrics:UIBarMetricsDefault];
    
    // 3.设置导航栏标题颜色为白色
    [navBar setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    
    // 4.设置导航栏按钮文字颜色为白色
    [barItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor],
                                      NSFontAttributeName : [UIFont systemFontOfSize:13]
                                      } forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"主页";
    [self addRecommendBtn];
}

- (void)addRecommendBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 120, 50);
    [btn setTitle:@"网易推荐应用" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [btn addTarget:self action:@selector(recommendClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)recommendClick
{
    ViewController *viewController = [[ViewController alloc] init];
    viewController.jsonString = @"more_project.json";
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
