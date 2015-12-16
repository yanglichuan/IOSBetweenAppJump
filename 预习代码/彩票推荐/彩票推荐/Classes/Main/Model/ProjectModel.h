//
//  ProjectModel.h
//  彩票推荐
//
//  Created by apple on 15-1-7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *stitle;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *customUrl;

@property (nonatomic, assign, getter=isEverDownload) BOOL everDownload;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)projectWithDict:(NSDictionary *)dict;

@end
