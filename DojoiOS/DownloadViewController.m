//
//  DownloadViewController.m
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 4/13/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import "DownloadViewController.h"

#define IMAGE_ADDRESS @"http://www.hdcarwallpapers.com/walls/lamborghini_murcielago_lp670_4_sv-wide.jpg"

@interface DownloadViewController ()

@property (nonatomic, strong) DODownload* doDownload;

@end

@implementation DownloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.doDownload resetView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DODownload*)doDownload {
    DODownload* mainView = (DODownload*) self.view;
    return mainView;
}

- (IBAction)startDownload {
    [self.doDownload startLoading];
    
//    [self performSelectorInBackground:@selector(downloadImage) withObject:nil];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        [self downloadImage];
    });
    
}

- (IBAction)resetImage {
    [self.doDownload stopLoading];
    [self.doDownload resetView];
}

- (void) downloadImage {
    NSURL *url = [NSURL URLWithString:IMAGE_ADDRESS];
    self.doDownload.imgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];

    [self.doDownload stopLoading];
}

@end
