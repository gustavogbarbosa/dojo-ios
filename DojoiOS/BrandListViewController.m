//
//  HomeViewController.m
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/12/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import "BrandListViewController.h"

@interface BrandListViewController ()
@property (nonatomic, strong) DOBrandList *doBrandList;
@property (nonatomic, strong) NSMutableArray *commonBrandArray;
@property (nonatomic, strong) NSMutableArray *fancyBrandArray;
@property (nonatomic, strong) NSArray *brands;
@end

@implementation BrandListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Brands";
 
    [self.doBrandList setupWithColor:[UIColor redColor] andFont:[UIFont fontWithName:@"Arial" size:18] andTitle:self.titleButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshTableView) name:@"refreshtableview" object:nil];
    
    [self refreshTableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)refreshTableView {
    self.commonBrandArray = [[NSMutableArray alloc] init];
    self.fancyBrandArray = [[NSMutableArray alloc] init];

    self.brands = [BrandAcessor getAllBrands];
    
    for (Brand *brand in self.brands) {
        if (brand.isFancy) {
            [self.fancyBrandArray addObject:brand];
        } else {
            [self.commonBrandArray addObject:brand];
        }
    }
    
    [self.doBrandList.tblView reloadData];
}


- (DOBrandList*)doBrandList {
    DOBrandList* myHome = (DOBrandList*) self.view;
    return myHome;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier = @"Cell";
    
    HomeCustomCell* cell = (HomeCustomCell*) [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil){
       
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        cell = (HomeCustomCell*) [[[NSBundle mainBundle] loadNibNamed:@"HomeCustomCell" owner:self options:nil] firstObject];
    }
    
    //Uma forma mais nova de se obter o index do array
    //cell.textLabel.text = self.carArray[indexPath.row];
    Brand *brand;
    
    if(indexPath.section == 0) {
        brand = self.fancyBrandArray[indexPath.row];
    } else {
        brand = self.commonBrandArray[indexPath.row];
    }
    
    //Forma mais antiga de se obter o index do array (através de um método objectAtIndex do objeto NSArray (by monan)
    cell.lblCar.text = brand.name;
    
    cell.imgCar.image = [UIImage imageNamed:[NSString stringWithFormat:@"car-%li.jpg",(long)indexPath.row]];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return (section == 0) ? @"FANCY": @"COMMON";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger numberOfLines;
    
    if(section == 0) {
        numberOfLines = self.fancyBrandArray.count;
    } else {
        numberOfLines = self.commonBrandArray.count;
    }
    
    return numberOfLines;

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    [self performSegueWithIdentifier:@"segueCars" sender:indexPath];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indexPath = (NSIndexPath *) sender;
    Brand *brand ;
    
    if (indexPath.section == 0) {
       brand = (Brand *) [self.fancyBrandArray objectAtIndex:indexPath.row];
    } else {
        brand = (Brand *) [self.commonBrandArray objectAtIndex:indexPath.row];
    }
    
    CarsViewController *carsViewController = segue.destinationViewController;
    [carsViewController setBrandId:brand.idBrand];
    carsViewController.brandName = brand.name;
}

- (IBAction)openAddNewBrand{
    AddBrandViewController *view = [[AddBrandViewController alloc] init];
    
    [self.navigationController pushViewController:view animated:YES];
}

//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    return 60.0f;
//}


@end
