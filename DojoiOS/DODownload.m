//
//  DODownload.m
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 4/13/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import "DODownload.h"

#define ANIMATION_DURATION 0.5

@implementation DODownload

- (void)resetView {
    [self.spinner setAlpha:0];
    [self.imgView setImage:nil];
}

- (void)startLoading {
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        [self.spinner setAlpha:1];
        [self.spinner startAnimating];
    }];
}

- (void)stopLoading {
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        [self.spinner stopAnimating];
        [self.spinner setAlpha:0];
    }];
}

@end
