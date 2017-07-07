//
//  L_QuestionBankVC.m
//  suguo
//
//  Created by luhongyu on 17/7/3.
//  Copyright © 2017年 luhongyu. All rights reserved.
//

#import "L_QuestionBankVC.h"

@interface L_QuestionBankVC ()

@end

@implementation L_QuestionBankVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"题库"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)bnClick:(id)sender {
    
    
    if ([self.dk_manager.themeVersion isEqualToString:DKThemeVersionNormal]) {
        self.dk_manager.themeVersion = DKThemeVersionNight;
    }else if ([self.dk_manager.themeVersion isEqualToString:DKThemeVersionNight]){
        self.dk_manager.themeVersion = DKThemeVersionNormal;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
