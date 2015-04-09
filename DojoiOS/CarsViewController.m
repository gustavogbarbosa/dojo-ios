//
//  CarsViewController.m
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 4/2/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import "CarsViewController.h"

@interface CarsViewController ()

@property (nonatomic, strong) NSArray *cars;

@end

@implementation CarsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.brandName;
    self.cars = [CarAcessor getCarsByBrand:self.brandId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    CarCustomCell* cell = (CarCustomCell *)[tableView cellForRowAtIndexPath:indexPath];

    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:cell.lblName.text message:cell.lblInformation.text preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil];
    

    [alertController addAction:actionOK];

    [self presentViewController:alertController animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier = @"Cell";
    
    CarCustomCell* cell = (CarCustomCell*) [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil){
        
        cell = (CarCustomCell*) [[[NSBundle mainBundle] loadNibNamed:@"CarCustomCell" owner:self options:nil] firstObject];
    }
    Car* car = [[Car alloc]init];
    car = self.cars[indexPath.row];
    
    //Forma mais antiga de se obter o index do array (através de um método objectAtIndex do objeto NSArray (by monan)
    cell.lblName.text = car.name;
    cell.lblHP.text = [NSString stringWithFormat:@"%.2f", car.hp];
    cell.lblInformation.text = car.information;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.cars.count;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}


@end
