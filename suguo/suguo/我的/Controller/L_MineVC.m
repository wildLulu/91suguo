//
//  L_MineVC.m
//  suguo
//
//  Created by luhongyu on 17/7/3.
//  Copyright © 2017年 luhongyu. All rights reserved.
//

#import "L_MineVC.h"
#import "L_PersonDetailVC.h"
#import "L_MessageCenter.h"

@interface L_MineVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewHeader;

@end

@implementation L_MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"我的"];

    [_imageViewHeader sd_setImageWithURL:[NSURL URLWithString:@"http://ww1.sinaimg.cn/bmiddle/6a74b92bjw1eskajlfzdxj206x08t3yy.jpg"]];
}

#pragma  mark - Tap

// 个人中心
- (IBAction)personCenterTap:(id)sender {
    
    L_PersonDetailVC *vc = [[L_PersonDetailVC alloc] init];
    
    vc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
}

// 优惠券
- (IBAction)couponTap:(id)sender {
    // 7.5  TODO
}

// 购买中心
- (IBAction)buyCenterTap:(id)sender {
}

// 分享
- (IBAction)shareTap:(id)sender {
}

// 学习统计
- (IBAction)statisticsTap:(id)sender {
}

// 消息中心
- (IBAction)messageCenterTap:(id)sender {

    L_MessageCenter *vc = [[L_MessageCenter alloc] init];
    
    vc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
}

// 视频下载
- (IBAction)videoDownloadTap:(id)sender {
}

// 在线客服
- (IBAction)serviceTap:(id)sender {
}

//关于我们
- (IBAction)aboutTap:(id)sender {
}

//法律条款
- (IBAction)lawTap:(id)sender {
}


@end
