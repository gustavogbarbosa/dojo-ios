//
//  DODownload.h
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 4/13/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DODownload : UIView

@property (nonatomic, weak) IBOutlet UIImageView* imgView;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView* spinner;

- (void)resetView;
- (void)startLoading;
- (void)stopLoading;

@end
