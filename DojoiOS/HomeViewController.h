//
//  HomeViewController.h
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/12/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DOHome.h"
#import "HomeCustomCell.h"
#import "BrandAcessor.h"
#import "CarsViewController.h"

@interface HomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSString *titleButton;

@end
