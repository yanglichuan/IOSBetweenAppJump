//
//  ViewController.m
//  彩票推荐
//
//  Created by apple on 15-1-7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "ProjectCell.h"
#import "ProjectModel.h"

@interface ViewController ()
{
    NSArray *_projectData;
}
@end

@implementation ViewController

- (void)setJsonString:(NSString *)jsonString
{
    NSString *path = [[NSBundle mainBundle] pathForResource:jsonString ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        ProjectModel *p = [ProjectModel projectWithDict:dict];
        p.everDownload = [[UIApplication sharedApplication] canOpenURL:[self getUrl:p.customUrl]];
        [tempArray addObject:p];
    }
    _projectData = tempArray;
}

- (NSURL *)getUrl:(NSString *)url
{
    NSString *urlStr = [NSString stringWithFormat:@"%@://", url];
    return [NSURL URLWithString:urlStr];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.title = @"推荐应用";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.allowsSelection = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _projectData.count;
}

- (ProjectCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    ProjectCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[ProjectCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.project = _projectData[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

@end
