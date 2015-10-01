//
//  parseViewController.m
//  UserLoginAndRegistration
//
//  Created by inv obr on 3/09/15.
//  Copyright (c) 2015 inv obr. All rights reserved.
//

#import "parseViewController.h"

@interface parseViewController ()

@end

@implementation parseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)parse:(NSDictionary *)array{
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://api.parse.com/1/classes/register"]];
    request.HTTPMethod = @"POST";
    [request setValue:@"CkS5Aa4RAquQ16UZ7FXnbQVGuGa41HrbqNyfLhTk" forHTTPHeaderField:@"X-Parse-Application-Id"];
    [request setValue:@"l888TmoQeWKiY7W73zHkyHyBSRwulG0UIFZuHWax" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSError *errores;
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&errores];
    if (errores) {
        NSLog(@"Se presento un error");
        return;
    }
    
    NSURLSession *session =[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSError *error1;
        NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error1];
        NSString *dt = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSHTTPURLResponse *URLResponse = (NSHTTPURLResponse *)response;
        
        if (URLResponse.statusCode == 201) {
            
            
        } else {
            
        }
        
        NSLog(@"%@", JSONDictionary);
        
        NSLog(@"%@", dt);
        
    }];
    
    [dataTask resume];
    
}


@end
