//
//  L_MessageCenter.m
//  suguo
//
//  Created by luhongyu on 17/7/5.
//  Copyright © 2017年 luhongyu. All rights reserved.
//

#import "L_MessageCenter.h"
#import "L_MessageCenterCell.h"

@interface L_MessageCenter ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_dataArr;
}
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation L_MessageCenter

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTitle:@"消息中心"];
    
    _dataArr = @[@"撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死",@"撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死",@"撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死",@"撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死",@"撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死撒很快就恢复的开始 ，大家啊手机费 i 哦多少分都送飞机的烦恼是咖啡呢啊烦死你打死",@"dasd盛大的"];
    
    [self addAllReadBtn];
    
    [self.view addSubview:self.tableView];
}

- (void)addAllReadBtn{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"全部标为已读" forState:UIControlStateNormal];
    [btn setTitleColor:UIColorFromRGB(0x125fa7) forState:UIControlStateNormal];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 3;
    btn.layer.borderColor = UIColorFromRGB(0x125fa7).CGColor;
    btn.layer.borderWidth = 1;
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(AllRead:) forControlEvents:UIControlEventTouchUpInside];
    btn.center = CGPointMake(ScreenWidth/2, 25);
    btn.bounds = CGRectMake(0, 0, 145, 30);
    [self.view addSubview:btn];
}

#pragma  mark - Action

- (void)AllRead:(UIButton *)btn{
    
}

#pragma  mark - TableView

-(UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, ScreenWidth, ScreenHeight - 64 - 50) style:UITableViewStylePlain];
        
        _tableView.separatorColor = UIColorFromRGB(0xcccccc);
        _tableView.delegate =self;
        _tableView.dataSource =self;
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerNib:[UINib nibWithNibName:@"L_MessageCenterCell" bundle:nil] forCellReuseIdentifier:@"L_MessageCenterCell"];
        _tableView.estimatedRowHeight = 88;
    }
    
    return  _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    L_MessageCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"L_MessageCenterCell"];
    
    [cell fillData:_dataArr[indexPath.row]];
    
    return cell;
}

@end
