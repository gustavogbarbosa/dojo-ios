//
//  AddBrandViewController.m
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 4/9/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import "AddBrandViewController.h"


@interface AddBrandViewController ()

@property (nonatomic, strong) DOAddBrand* doAddBrand;

@end

@implementation AddBrandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DOAddBrand*)doAddBrand {
    DOAddBrand* addBrand = (DOAddBrand*) self.view;
    return addBrand;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)handleSaveNewBrand {
    
    Brand* newBrand = [[Brand alloc] init];
    
    newBrand.name = self.doAddBrand.txtBrandName.text;
    newBrand.isFancy = (self.doAddBrand.segmentBrandType.selectedSegmentIndex == 0);
    newBrand.isActive = self.doAddBrand.switchActive.on;
    
    if ([newBrand.name isEqualToString:@""]) {
        NSLog(@"%@");
    } else {
        if ([BrandAcessor saveNewBrand:newBrand]) {
            NSLog(@"Salvo com sucesso");
            [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshtableview" object:nil];
            [self.navigationController popViewControllerAnimated:YES];
        }
        else {
            NSLog(@"Erro");
        }
    }
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
