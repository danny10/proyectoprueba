//
//  customTableViewCell.m
//  UserLoginAndRegistration
//
//  Created by inv obr on 8/09/15.
//  Copyright (c) 2015 inv obr. All rights reserved.
//

#import "customTableViewCell.h"

@implementation customTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)showAlert:(id)sender
{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(createCell:)]) {
        [self.delegate createCell:self];
    }
    
  
    
    
}

@end
