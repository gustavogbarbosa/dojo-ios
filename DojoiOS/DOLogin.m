//
//  DOLogin.m
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/10/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import "DOLogin.h"

@implementation DOLogin

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setupWithColor:(UIColor*)color
               andFont:(UIFont*)font {
    
    [self.btnNext setBackgroundColor:color];
    [self.btnNext.titleLabel setFont:font];
    [self.btnNext setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnNext setTitle:NSLocalizedString(@"Next", nil) forState:UIControlStateNormal];
}

@end
