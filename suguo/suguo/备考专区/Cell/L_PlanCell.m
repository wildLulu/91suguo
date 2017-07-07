//
//  L_PlanCell.m
//  suguo
//
//  Created by luhongyu on 17/7/4.
//  Copyright © 2017年 luhongyu. All rights reserved.
//

#import "L_PlanCell.h"

@implementation L_PlanCell
{
    __weak IBOutlet UIImageView *imageViewHeader;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillData{
    
    [imageViewHeader sd_setImageWithURL:[NSURL URLWithString:@"http://img.tupianzj.com/uploads/allimg/160822/9-160R2213414.jpg"]];
}
@end
