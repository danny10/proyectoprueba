//
//  CustomTableViewCell.m
//  UITableViewPast1
//
//  Created by inv obr on 7/09/15.
//  Copyright (c) 2015 inv obr. All rights reserved.
//

#import "CustomTableViewCell.h"

//create properties in ,m file to protect these.
@interface CustomTableViewCell()

@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//i always work with mvc, so i create model and add to cell, but now i present a simple example and move properties to .h file and set these directly.

@end
