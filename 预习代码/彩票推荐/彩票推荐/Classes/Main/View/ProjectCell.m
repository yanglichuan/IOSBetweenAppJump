//
//  ProjectCell.m
//  彩票推荐
//
//  Created by apple on 15-1-7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ProjectCell.h"
#import "ProjectModel.h"

#define kIconW 54
#define kIconH 54

#define kPadding 10

#define kBtnW 40
#define kBtnH 40

@interface ProjectCell()
{
    UIButton *_controlBtn;
    
    BOOL _canOpen;
}
@end

@implementation ProjectCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        _controlBtn = btn;
        
        [self.contentView addSubview:btn];
    }
    
    return self;
}

- (void)btnClick
{
    if (_canOpen) {
        [[UIApplication sharedApplication] openURL:[self getUrl:_project.customUrl]];
    } else {
        [[UIApplication sharedApplication] openURL:[self getUrl:_project.url]];
    }
}

- (void)setProject:(ProjectModel *)project
{
    _project = project;
    _canOpen = project.isEverDownload;
    
    self.imageView.image = [UIImage imageNamed:project.icon];
    self.textLabel.text = project.title;
    self.detailTextLabel.text = project.stitle;
    
    if (project.isEverDownload) {
        [_controlBtn setImage:[UIImage imageNamed:@"appadcell_openbutton"] forState:UIControlStateNormal];
    } else {
        [_controlBtn setImage:[UIImage imageNamed:@"appadcell_downloadbutton"] forState:UIControlStateNormal];
    }
}

- (NSURL *)getUrl:(NSString *)url
{
    NSString *urlStr = [NSString stringWithFormat:@"%@://", url];
    return [NSURL URLWithString:urlStr];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat cellH = self.frame.size.height;
    self.imageView.frame = CGRectMake(cellH - kIconW, (cellH - kIconH) * 0.5, kIconW, kIconH);
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    CGRect oldLabelFrame = self.textLabel.frame;
    oldLabelFrame.origin.x = CGRectGetMaxX(self.imageView.frame) + kPadding;
    self.textLabel.frame = oldLabelFrame;
    
    CGRect oldDetailLabelFrame = self.detailTextLabel.frame;
    oldDetailLabelFrame.origin.x = oldLabelFrame.origin.x;
    self.detailTextLabel.frame = oldDetailLabelFrame;
    
    _controlBtn.center = CGPointMake(self.frame.size.width - kBtnW * 0.5 - kPadding, self.frame.size.height * 0.5);
    _controlBtn.bounds = CGRectMake(0, 0, kBtnW, kBtnH);
}

@end
