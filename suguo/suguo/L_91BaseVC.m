//
//  L_91BaseVC.m
//  suguo
//
//  Created by luhongyu on 17/7/3.
//  Copyright © 2017年 luhongyu. All rights reserved.
//

#import "L_91BaseVC.h"

@interface L_91BaseVC ()

@end

@implementation L_91BaseVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.navigationController){
        [self.navigationController.navigationBar setTranslucent:NO];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    
    
    if (self.navigationController.viewControllers.count > 1) {
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClick)];
    }

}

#pragma -mark BtnClick

- (void)backBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
