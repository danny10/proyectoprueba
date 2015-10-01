//
//  loginViewController.h
//  UserLoginAndRegistration
//
//  Created by inv obr on 2/09/15.
//  Copyright (c) 2015 inv obr. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol createViewControllerDelegate <NSObject>

@required

- (void)createDidFinish;

@end

@interface createViewController : UIViewController

@property (nonatomic, copy) NSDictionary *selectedUser;
@property (nonatomic, weak) id<createViewControllerDelegate> delegate;


@end
