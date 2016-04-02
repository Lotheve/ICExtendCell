//
//  ExtendCell.m
//  Cell展开&收缩
//
//  Created by 卢旭峰 on 16/3/28.
//  Copyright © 2016年 卢旭峰. All rights reserved.
//

#import "ExtendCell.h"

@interface ExtendCell ()

@end

@implementation ExtendCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.labelContent.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
