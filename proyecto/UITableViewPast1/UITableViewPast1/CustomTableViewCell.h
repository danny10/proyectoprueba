//
//  CustomTableViewCell.h
//  UITableViewPast1
//
//  Created by inv obr on 7/09/15.
//  Copyright (c) 2015 inv obr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleCell;
@property (weak, nonatomic) IBOutlet UILabel *detaiCell;

// in controller file , i set these properties

@end


