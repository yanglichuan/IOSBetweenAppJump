//
//  ProjectModel.m
//  彩票推荐
//
//  Created by apple on 15-1-7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ProjectModel.h"

@implementation ProjectModel

+ (instancetype)projectWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.stitle = dict[@"stitle"];
        self.ID = dict[@"id"];
        self.url = dict[@"url"];
        self.icon = dict[@"icon"];
        self.customUrl = dict[@"customUrl"];
    }
    return self;
}

@end
