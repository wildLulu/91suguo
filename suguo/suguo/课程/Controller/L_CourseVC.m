//
//  L_CourseVC.m
//  suguo
//
//  Created by luhongyu on 17/7/3.
//  Copyright © 2017年 luhongyu. All rights reserved.
//

#import "L_CourseVC.h"
#import "L_CourseCell.h"

@interface L_CourseVC ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *textFSearch;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightTopView;

@end

@implementation L_CourseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_tableView registerNib:[UINib nibWithNibName:@"L_CourseCell" bundle:nil] forCellReuseIdentifier:@"L_CourseCell"];
    _tableView.estimatedRowHeight = 101;
    
    self.navigationItem.titleView = [self getTitleView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"分类"] style:UIBarButtonItemStylePlain target:self action:@selector(category)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"礼物"] style:UIBarButtonItemStylePlain target:self action:@selector(gift)];
}

- (UIView *)getTitleView{
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"全部视频",@"收藏视频"]];
    
    seg.selectedSegmentIndex = 0;
    
    [seg addTarget:self action:@selector(segChange:) forControlEvents:UIControlEventValueChanged];
    
    return seg;
}

- (void)segChange:(UISegmentedControl *)seg{
    _heightTopView.constant = seg.selectedSegmentIndex == 0?35:0;
}

// 分类
- (void)category{

}

// 礼物
- (void)gift{

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    L_CourseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"L_CourseCell"];
    
    [cell fillData];
    
    return cell;
}

@end
