//
//  DOAddBrand.h
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 4/9/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DOAddBrand : UIView

@property (nonatomic, weak) IBOutlet UITextField *txtBrandName;
@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentBrandType;
@property (nonatomic, weak) IBOutlet UISwitch *switchActive;


@end
