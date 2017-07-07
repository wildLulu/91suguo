//
//  L_MessageCenterCell.m
//  suguo
//
//  Created by luhongyu on 17/7/5.
//  Copyright © 2017年 luhongyu. All rights reserved.
//

#import "L_MessageCenterCell.h"

@implementation L_MessageCenterCell
{
    __weak IBOutlet UILabel *labTitle;
    __weak IBOutlet UILabel *labDate;
    __weak IBOutlet UILabel *labContent;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)fillData:(NSString *)str{
    
    labContent.text = str;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
