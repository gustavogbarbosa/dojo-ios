//
//  DOHome.h
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/17/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DOBrandList : UIView

@property (nonatomic, weak) IBOutlet UITableView *tblView;

- (void)setupWithColor:(UIColor*)color
               andFont:(UIFont*)font
               andTitle:(NSString*)title;


@end
