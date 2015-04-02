//
//  CarCustomCell.h
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 4/2/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarCustomCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel* lblName;
@property (nonatomic, weak) IBOutlet UILabel* lblInformation;
@property (nonatomic, weak) IBOutlet UILabel* lblHP;

@end
