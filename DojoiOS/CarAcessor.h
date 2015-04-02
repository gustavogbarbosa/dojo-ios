//
//  CarAcessor.h
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/31/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "DBManager.h"
#import "Car.h"

@interface CarAcessor : NSObject

+ (BOOL) saveNewCar:(Car *) carObject;
+ (NSArray *) getAllCars;
+ (BOOL)parseCarResponse:(NSArray *)array;
+ (NSArray *) getCarsByBrand:(NSInteger)brandId;

@end
