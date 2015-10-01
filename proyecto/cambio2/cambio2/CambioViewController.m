//
//  CambioViewController.m
//  cambioMoneda
//
//  Created by inv obr on 14/09/15.
//  Copyright (c) 2015 inv obr. All rights reserved.
//

#import "CambioViewController.h"
#import "resultadoCambioViewController.h"

@interface CambioViewController ()

@property(nonatomic, weak) IBOutlet UITextField * Dolar;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;



@end

@implementation CambioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:self.tapGesture];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tap:(UITapGestureRecognizer *)tapGesture {
    [self.view endEditing:YES];
}

- (IBAction)cambio:(id)sender {
    [self performSegueWithIdentifier:@"resultadoCambioViewController" sender:nil];
    
}



@end
