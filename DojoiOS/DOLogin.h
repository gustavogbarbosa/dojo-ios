//
//  DOLogin.h
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/10/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DOLogin : UIView

@property (nonatomic,weak) IBOutlet UIButton* btnNext;
@property (nonatomic,weak) IBOutlet UILabel* lblLogin;
@property (nonatomic,weak) IBOutlet UILabel* lblPassword;
@property (nonatomic,weak) IBOutlet UITextField* txtLogin;
@property (nonatomic,weak) IBOutlet UITextField* txtPassword;


- (void)setupWithColor:(UIColor*)color andFont:(UIFont*)font;

@end
