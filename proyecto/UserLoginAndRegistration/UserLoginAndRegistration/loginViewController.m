//
//  loginViewController.m
//  UserLoginAndRegistration
//
//  Created by inv obr on 3/09/15.
//  Copyright (c) 2015 inv obr. All rights reserved.
//

#import "loginViewController.h"
#import "createViewController.h"
#import "listaViewController.h"

@interface loginViewController ()


@property (nonatomic, weak) IBOutlet UITextField *email;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;


@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerUser:(id)sender {
    
    [self performSegueWithIdentifier:@"createViewController" sender:nil];
    
}


- (IBAction)AllUser:(id)sender {
    
    [self performSegueWithIdentifier:@"listaViewController" sender:nil];
    
}


@end
