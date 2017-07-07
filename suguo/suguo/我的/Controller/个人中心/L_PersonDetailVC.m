//
//  L_PersonDetailVC.m
//  suguo
//
//  Created by luhongyu on 17/7/5.
//  Copyright © 2017年 luhongyu. All rights reserved.
//

#import "L_PersonDetailVC.h"
#import "L_EditPersonInfoVC.h"
#import "L_EditHeaderViewController.h"

@interface L_PersonDetailVC ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewHeader;
@property (weak, nonatomic) IBOutlet UIButton *btnWoman;
@property (weak, nonatomic) IBOutlet UIButton *btnMan;

@end

@implementation L_PersonDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"个人信息"];

    [_imageViewHeader sd_setImageWithURL:[NSURL URLWithString:@"http://ww1.sinaimg.cn/bmiddle/6a74b92bjw1eskajlfzdxj206x08t3yy.jpg"]];
}

#pragma  mark - Tap

// 头像
- (IBAction)headerTap:(id)sender {
    
    L_EditHeaderViewController *vc = [[L_EditHeaderViewController alloc] init];
    
    [self presentViewController:vc animated:YES completion:nil];
}

// 个性签名
- (IBAction)signatureTap:(id)sender {
    
    L_EditPersonInfoVC *vc = [[L_EditPersonInfoVC alloc] init];
    
    vc.type = 1;
    
    [self.navigationController pushViewController:vc animated:YES];
}

// 邮箱
- (IBAction)emailTap:(id)sender {
    
    L_EditPersonInfoVC *vc = [[L_EditPersonInfoVC alloc] init];
    
    vc.type = 2;
    
    [self.navigationController pushViewController:vc animated:YES];
}

// 修改密码
- (IBAction)passwordTap:(id)sender {
}

#pragma  mark - BtnClick

- (IBAction)btnClick:(UIButton *)sender {
    
    _btnMan.selected = NO;
    _btnWoman.selected = NO;
    sender.selected = YES;
}

@end
