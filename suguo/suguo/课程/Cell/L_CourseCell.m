//
//  L_CourseCell.m
//  suguo
//
//  Created by luhongyu on 17/7/4.
//  Copyright © 2017年 luhongyu. All rights reserved.
//

#import "L_CourseCell.h"
#import "LDXScore.h"

@implementation L_CourseCell
{
    __weak IBOutlet UIImageView *imageViewHeader;
    __weak IBOutlet LDXScore *scoreView;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)fillData{

    scoreView.show_star = 4;
    scoreView.userInteractionEnabled = NO;
    
    [imageViewHeader sd_setImageWithURL:[NSURL URLWithString:@"http://img.tupianzj.com/uploads/allimg/160822/9-160R2213414.jpg"]];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
