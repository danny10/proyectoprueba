//
//  ViewController.h
//  pickerview
//
//  Created by inv obr on 11/09/15.
//  Copyright (c) 2015 inv obr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource>
{
    NSArray * citycollection;
    
}

@property (weak, nonatomic) IBOutlet UIPickerView *cityPicker;

@property (weak, nonatomic) IBOutlet UILabel *lblcity;

-(IBAction)getselected:(id)sender;

@end

