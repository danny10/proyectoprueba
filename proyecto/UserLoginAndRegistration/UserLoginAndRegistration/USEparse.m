//
//  USEparse.m
//  UserLoginAndRegistration
//
//  Created by inv obr on 4/09/15.
//  Copyright (c) 2015 inv obr. All rights reserved.
//

#import "USEparse.h"

@implementation USEparse


-(void)parse:(NSDictionary *)datos path:(NSString *)url httpMethod:(NSString *) method completion:(void(^)(NSDictionary *response)) block {
    
    NSString * link=[NSString stringWithFormat:@"https://api.parse.com/1/classes/%@",url];
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:link]];
    
    request.HTTPMethod = method;
    
    [request setValue:@"CkS5Aa4RAquQ16UZ7FXnbQVGuGa41HrbqNyfLhTk" forHTTPHeaderField:@"X-Parse-Application-Id"];
    [request setValue:@"l888TmoQeWKiY7W73zHkyHyBSRwulG0UIFZuHWax" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSError *errores;
    
    if ([method isEqualToString:@"POST" ] || [ method isEqualToString:@"PUT"] ) {
        
        request.HTTPBody = [NSJSONSerialization dataWithJSONObject:datos options:NSJSONWritingPrettyPrinted error:&errores];
    }else{
        
        
        
    }
    
    
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
        

        block(JSONDictionary);
        
        NSLog(@"%@", JSONDictionary);
        
        NSLog(@"%@", dt);
        
    }];
    
    [dataTask resume];
    
}

@end

