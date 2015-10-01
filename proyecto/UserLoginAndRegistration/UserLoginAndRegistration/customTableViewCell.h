//
//  customTableViewCell.h
//  UserLoginAndRegistration
//
//  Created by inv obr on 8/09/15.
//  Copyright (c) 2015 inv obr. All rights reserved.
//

#import <UIKit/UIKit.h>
@class customTableViewCell;

@protocol createTableViewCellDelegate <NSObject>

@required

- (void)createCell:(customTableViewCell * ) cell;

@end



@interface customTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *lastname;

@property (nonatomic, weak) id<createTableViewCellDelegate> delegate;


-(IBAction)showAlert:(id)sender;


@end



