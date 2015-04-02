//
//  DOHome.m
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/17/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import "DOHome.h"

@implementation DOHome

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)setupWithColor:(UIColor*)color
               andFont:(UIFont*)font
              andTitle:(NSString*)title {
    
    [self.btnVoltar setBackgroundColor:color];
    [self.btnVoltar.titleLabel setFont:font];
    [self.btnVoltar setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnVoltar setTitle:title forState:UIControlStateNormal];
}


@end
