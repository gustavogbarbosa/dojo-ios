//
//  CarsViewController.h
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 4/2/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarAcessor.h"
#import "CarCustomCell.h"


@interface CarsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, assign) NSInteger brandId;
@property (nonatomic, assign) NSString *brandName;

@end
