//
//  ViewController.m
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/10/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) DOLogin* doLogin;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.doLogin setupWithColor:[UIColor redColor] andFont:[UIFont fontWithName:@"Helvetica" size:18]]; //sintaxe da chamada do metodo
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.doLogin setupWithColor:[UIColor blueColor] andFont:[UIFont fontWithName:@"Helvetica" size:18]];
}

- (DOLogin*)doLogin {
    DOLogin* myLogin = (DOLogin*) self.view;
    return myLogin;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    NSString *segueName = @"nextSegue";
    
    NSLog(@"nome da segue: %@", segueName);
    if ([segue.identifier isEqualToString:segueName]){
        BrandListViewController* homeViewController = segue.destinationViewController;
        homeViewController.titleButton = @"Back";
    }
}

- (IBAction)goNext:(id)sender{
   
    
//    if(YES){
    
       [self performSegueWithIdentifier:@"nextSegue" sender:sender];
        
//    }else{
//        
//        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Erro" message:@"Preencha os campos corretamente" preferredStyle:UIAlertControllerStyleAlert ];
//        
//        UIAlertAction* actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil];
//    
//        [alertController addAction:actionOK];
//        
//        [self presentViewController:alertController animated:YES completion:^{
//            NSLog(@"Monan");
//        }];
//    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField == self.doLogin.txtLogin) {
        [self.doLogin.txtPassword becomeFirstResponder];
    }
    else {
        [textField resignFirstResponder];
    }
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"Comecando a digitar");
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"Finalizando digitacao");
}

- (BOOL) checkFields {
    if (![self.doLogin.txtLogin.text isEqualToString:@"admin"]) {
        return NO;
    }
    
    if (![self.doLogin.txtPassword.text isEqualToString:@"123"]) {
        return NO;
    }
    return YES;
}

- (IBAction)openThreadManager:(id)sender {
    ProgressViewController* progressView = [[ProgressViewController alloc]init];
    [self.navigationController pushViewController:progressView animated:YES];
}

@end
