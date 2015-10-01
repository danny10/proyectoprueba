//
//  listaViewController.m
//  UserLoginAndRegistration
//
//  Created by inv obr on 3/09/15.
//  Copyright (c) 2015 inv obr. All rights reserved.
//

#import "listaViewController.h"
#import "USEparse.h"
#import "CustomTableViewCell.h"
#import "createViewController.h"


@interface listaViewController ()<createViewControllerDelegate, UITableViewDataSource, UITableViewDelegate,createTableViewCellDelegate>

@property (nonatomic, copy) NSMutableArray *items;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation listaViewController



-(IBAction)button:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                          @"Alerta" message: @"Buenas Tardes" delegate:nil cancelButtonTitle:@"Cancelar"
                                         otherButtonTitles:@"Continuar" ,nil
                          ];
    
    [alert show];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.items = [NSMutableArray array];
    [self request];
    
    self.title = @"Custom cell";
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([customTableViewCell class])  bundle:nil ] forCellReuseIdentifier:NSStringFromClass([customTableViewCell class])];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self
                            action:@selector(refresh:)
                  forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    
    

}

- (void)createDidFinish {
    [self request];
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    [self request];
}

- (void)createCell:(customTableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell]; // Obtengo la posicion de la celda
    NSDictionary *dict = [self.items objectAtIndex:indexPath.row]; // Obtengo los datos para esa posicion
    NSString *message = [NSString stringWithFormat:@"usuario :%@", dict[@"name"]];
    UIAlertView * alert =[[UIAlertView alloc] initWithTitle:@"system message" message:message delegate:nil cancelButtonTitle:@"Exit" otherButtonTitles:nil, nil];
    
    [alert show];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.funcion utilizada para celdacustom
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    
    //for example return 10 rows in section funcion para mostrar cuantas lineas
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // static NSString *CellIdentifier =@"tabla";
    // this method return custom cell-> change UITableViewCell to CustomTableViewCell
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([customTableViewCell class]) forIndexPath:indexPath];
    
    NSDictionary *JSONDictionary = [self.items objectAtIndex:indexPath.row];
    
    cell.name.text=[JSONDictionary objectForKey:@"name"]; //set by this section
    cell.lastname.text=[JSONDictionary objectForKey:@"lastName"]; //set by indexpath row
    cell.delegate=self;
    
    return cell;
    
}


- (void)request {
     
    USEparse *classParse = [[USEparse alloc]init];
    [classParse parse:nil path:@"register" httpMethod:@"GET" completion:^(NSDictionary *response) {
        
        self.items = [response objectForKey:@"results"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
        });
        
    }];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    createViewController *createCtrl = [segue destinationViewController];
    createCtrl.delegate = self;
    
    if([segue.identifier isEqualToString:@"updatesuegue"]){
       NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
       createCtrl.selectedUser = [self.items objectAtIndex:indexPath.row];
    }
    
   
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"updatesuegue" sender:nil];
}

- (IBAction)registerUser:(id)sender {
    
    [self performSegueWithIdentifier:@"createViewController" sender:nil];
    
}


- (IBAction)cancelarUser:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}





/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 static NSString *CellIdentifier =@"tabla";
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
 NSDictionary *JSONDictionary = [self.items objectAtIndex:indexPath.row];
 cell.textLabel.text = [JSONDictionary objectForKey:@"name"];
 return cell;
 } funcion para mostrar datos en la tabla normal*/



@end
