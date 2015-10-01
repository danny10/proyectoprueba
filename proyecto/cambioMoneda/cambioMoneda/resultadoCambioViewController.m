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
@property(nonatomic, weak) IBOutlet UITextField * brasil;
@property(nonatomic, copy)  NSDictionary * items;

@end

@implementation resultadoCambioViewController

- (void)viewDidLoad {
    //Do any additional setup after loading the view.
    [super viewDidLoad];
    [self Cambio];
   
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
               
               CGFloat resultado = self.valor * [[self.items objectForKey:@"EUR"]floatValue];
               self.euro.text= [NSString stringWithFormat:@"%.00f", resultado];
               
               CGFloat bras = self.valor * [[self.items objectForKey:@"BRL"]floatValue];
               self.brasil.text= [NSString stringWithFormat:@"%.00f", bras];
               
               CGFloat lib = self.valor * [[self.items objectForKey:@"GBP"]floatValue];
               self.libra.text= [NSString stringWithFormat:@"%.00f", lib];
               
               CGFloat ye = self.valor * [[self.items objectForKey:@"JPY"]floatValue];
               self.yen.text= [NSString stringWithFormat:@"%.00f", ye];
               
               
           }] resume];
}




@end
