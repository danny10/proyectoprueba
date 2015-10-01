//
//  loginViewController.m
//  UserLoginAndRegistration
//
//  Created by inv obr on 2/09/15.
//  Copyright (c) 2015 inv obr. All rights reserved.
//

#import "createViewController.h"
#import "USEparse.h"


@interface createViewController ()

@property (nonatomic, weak) IBOutlet UIButton *registerBtn;
@property (nonatomic, weak) IBOutlet UITextField *userNameField;
@property (nonatomic, weak) IBOutlet UITextField *lastNameField;
@property (nonatomic, weak) IBOutlet UITextField *email;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
@property (nonatomic, weak) IBOutlet UITextField *repeatPasswordField;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@end

@implementation createViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:self.tapGesture];
    if (self.selectedUser != nil) {
        self.userNameField.text = [self.selectedUser objectForKey:@"name"];
        self.lastNameField.text = [self.selectedUser objectForKey:@"lastName"];
        self.email.text = [self.selectedUser objectForKey:@"email"];
        self.passwordField.text = [self.selectedUser objectForKey:@"password"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tap:(UITapGestureRecognizer *)tapGesture {
    [self.view endEditing:YES];
}

- (IBAction)registerUser:(id)sender {
    [self registerNewUser];
}


- (IBAction)cancelarUser:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)allUser:(id)sender {
    
    [self performSegueWithIdentifier:@"listaViewController" sender:nil];
    
}


- (void) registerNewUser {
    [self.view endEditing:YES];
    NSMutableDictionary *jsonDictionary = [NSMutableDictionary dictionary];
    [jsonDictionary setObject:self.userNameField.text forKey: @"name"];
    [jsonDictionary setObject:self.lastNameField.text forKey: @"lastName"];
    [jsonDictionary setObject:self.email.text forKey: @"email"];
    [jsonDictionary setObject:self.passwordField.text forKey: @"password"];
    

    
    NSString *HTTPMethod = self.selectedUser ? @"PUT" : @"POST";
    NSString *path = @"register";
    if ([HTTPMethod isEqualToString:@"PUT"]) {
        path = [path stringByAppendingPathComponent:[self.selectedUser objectForKey:@"objectId"]];
    }
    USEparse *classParse = [[USEparse alloc]init];
    [classParse parse:jsonDictionary path:path httpMethod:HTTPMethod completion:^(NSDictionary *response) {
        
        NSLog(@"%@",response);
        
        if ([response objectForKey:@"createdAt"]) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(createDidFinish)]) {
                [self.delegate createDidFinish];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
        }
        
    }];
    
}

@end
