//
//  Car.h
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/31/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (nonatomic, assign) NSInteger idCar;
@property (nonatomic, assign) NSInteger fkBrand;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *information;
@property (nonatomic, assign) float hp;

@end
