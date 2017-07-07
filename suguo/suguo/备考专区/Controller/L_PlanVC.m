//
//  L_PlanVC.m
//  suguo
//
//  Created by luhongyu on 17/7/3.
//  Copyright © 2017年 luhongyu. All rights reserved.
//

#import "L_PlanVC.h"
#import "L_PlanCell.h"

@interface L_PlanVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)  UIScrollView *scrollView;

@property (nonatomic, strong)  UITableView *tableView;

@property (nonatomic, strong)  UIView *companionView;

@end

@implementation L_PlanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [self getTitleView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"分类"] style:UIBarButtonItemStylePlain target:self action:@selector(category)];
    
    [self.view addSubview:self.scrollView];
}

- (UIView *)getTitleView{
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"考试资讯",@"考试指南"]];
    
    seg.selectedSegmentIndex = 0;
    
    [seg addTarget:self action:@selector(segChange:) forControlEvents:UIControlEventValueChanged];
    
    return seg;
}

-(UIScrollView *)scrollView{
    
    if (!_scrollView) {
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64 - 49)];
        _scrollView.scrollEnabled = NO;//TODO
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(ScreenWidth * 2, _scrollView.frame.size.height);
        [_scrollView addSubview:self.tableView];
        [_scrollView addSubview:self.companionView];
        
    }
    return _scrollView;
}

-(UITableView *)tableView{
    if (!_tableView ) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, _scrollView.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorColor = UIColorFromRGB(0xcccccc);
        [_tableView registerNib:[UINib nibWithNibName:@"L_PlanCell" bundle:nil] forCellReuseIdentifier:@"L_PlanCell"];
        _tableView.estimatedRowHeight = 100;
    }
    
    return  _tableView;
}

- (UIView *)companionView{
    
    if (!_companionView) {
        _companionView = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, _scrollView.frame.size.height)];
        _companionView.backgroundColor = [UIColor clearColor];
        
        CGFloat space = 3;
        CGFloat width = (ScreenWidth - 2 * 5)/3.0;
        CGFloat height = width * 3/4;
        
        NSArray *images = @[@"课程大纲",@"报名入口",@"报名时间",
                            @"报名条件",@"考试科目",@"教材",
                            @"公告",@"查询",@"更多-2"];
        
        NSArray * titles = @[@"考试大纲",@"报名入口",@"报名时间",
                             @"报名条件",@"考试科目",@"考试教材",
                             @"考试公告",@"成绩查询",@"更多"];
        
        for (int i = 0; i < 9; i++) {
            
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake((i%3)*(width+space), (i/3)*(height + space), width, height)];
            view.tag = i;
            view.backgroundColor = [UIColor whiteColor];
            
            UIImage *image = [UIImage imageNamed:images[i]];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            imageView.center = CGPointMake(width/2, height/2 - 15);
            imageView.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
            [view addSubview:imageView];
            
            UILabel *lab = [[UILabel alloc] init];
            lab.center = CGPointMake(width/2, height/2 + 15);
            lab.bounds = CGRectMake(0, 0, width, 20);
            lab.text = titles[i];
            lab.textColor = UIColorFromRGB(0x666666);
            lab.font = [UIFont systemFontOfSize:14];
            lab.textAlignment = NSTextAlignmentCenter;
            [view addSubview:lab];
            
            [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(companionTap:)]];
            [_companionView addSubview:view];
        }
    }
    
    return _companionView;
}

- (void)companionTap:(UITapGestureRecognizer *)tap{
    
    NSLog(@"%ld",tap.view.tag);
}

- (void)segChange:(UISegmentedControl *)seg{
    
    [UIView animateWithDuration:0.0 animations:^{
       
        _scrollView.contentOffset = CGPointMake(seg.selectedSegmentIndex * ScreenWidth, 0);
    }];
}

// 分类
- (void)category{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    L_PlanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"L_PlanCell"];
    
    [cell fillData];
    
    return cell;
}

@end
