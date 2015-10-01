//
//  resultadoCambioViewController.m
//  cambioMoneda
//
//  Created by inv obr on 14/09/15.
//  Copyright (c) 2015 inv obr. All rights reserved.
//

#import "resultadoCambioViewController.h"

@interface resultadoCambioViewController ()

@property(nonatomic, weak) IBOutlet UITextField * libra;
@property(nonatomic, weak) IBOutlet UITextField * euro;
@property(nonatomic, weak) IBOutlet UITextField * yen;
@property(nonatomic, weak) IBOutlet UITextField * brasileño;
@property(nonatomic, weak) IBOutlet NSArray * items;

@end

@implementation resultadoCambioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)Cambio {
    
    NSString *fixerUrl=@"http://api.fixer.io/latest?base=USD";
    
    NSURLSession *session =[NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:fixerUrl]
           completionHandler :^(NSData *data,NSURLResponse *response,NSError *connectionError){
               
               if (connectionError) {
                   NSLog(@"error %@", connectionError);
                   return;
               }
               
               NSError *error;
               NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
               self.items = [JSONDictionary objectForKey:@"rates"];
               
           }] resume];
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
