//
//  ViewController.m
//  xxxxxx
//
//  Created by Jorge Orjuela on 8/31/15.
//  Copyright (c) 2015 Jorge Orjuela. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, copy) NSMutableArray *items;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = [NSMutableArray array];
    [self request];
    
    //UIAlertController       @"Hello world"
    // IBAction
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier =@"a";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *JSONDictionary = [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text = [JSONDictionary objectForKey:@"name"];
    return cell;
}


/*- (void)request {
    //  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.kbapi.co/g/Y5o6ZA-2"]];
    
    NSString *londonWeatherUrl=@"http://www.kbapi.co/g/Y5o6ZA-2";
    
    //request.HTTPMethod = @"GET";
    
    NSURLSession *session =[NSURLSession sharedSession];
    [session dataTaskWithURL:[NSURL URLWithString:londonWeatherUrl] completionHandler:^(NSData *data, NSURLResponse *response, NSError *connectionError) {
        //NSHTTPURLResponse *URLResponse = (NSHTTPURLResponse *)response;
        if (connectionError) {
            NSLog(@"error %@", connectionError);
            return;
        }
        
        NSError *error;
        NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        self.items = [[JSONDictionary objectForKey:@"data"] objectForKey:@"test"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}*/


- (void)request {
  //  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.kbapi.co/g/Y5o6ZA-2"]];
    
    NSString *londonWeatherUrl=@"http://www.kbapi.co/g/Y5o6ZA-2";
    
    //request.HTTPMethod = @"GET";
    
    NSURLSession *session =[NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:londonWeatherUrl] completionHandler :^(NSData *data,
                          NSURLResponse *response,NSError *connectionError){
         
        //NSHTTPURLResponse *URLResponse = (NSHTTPURLResponse *)response;
        if (connectionError) {
            NSLog(@"error %@", connectionError);
            return;
        }
        
        NSError *error;
        NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        self.items = [[JSONDictionary objectForKey:@"data"] objectForKey:@"test"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }] resume];
}

@end
