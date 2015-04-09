//
//  GesturesViewController.m
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 4/7/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import "GesturesViewController.h"

@interface GesturesViewController ()

@end

@implementation GesturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleRotate:(UIRotationGestureRecognizer*)recognizer {
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0;
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer*)recognizer {
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

-(IBAction)handlePan:(UIPanGestureRecognizer*)recognizer{
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0,0) inView:self.view];
}

- (IBAction)handleTap:(UITapGestureRecognizer*) recognizer {
    // aberto a implementacao
    
    [UIView animateWithDuration:2 animations:^{
        self.imgCar.frame = CGRectMake(
                                       self.imgCar.frame.origin.x - self.imgCar.frame.size.width / 2,
                                       self.imgCar.frame.origin.y - self.imgCar.frame.size.height / 2,
                                       self.imgCar.frame.size.width * 2,
                                       self.imgCar.frame.size.height * 2);

    } completion:^(BOOL finished) {
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Tap" message:@"Congrats!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil];
        
        [alertController addAction:actionOK];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
