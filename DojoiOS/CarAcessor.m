//
//  CarAcessor.m
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/31/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//
/*
CREATE TABLE IF NOT EXISTS tb_cars
(
 id_car INTEGER NOT NULL PRIMARY KEY,
 name TEXT,
 information TEXT,
 hp REAL,
 id_brand_fk INTEGER NOT NULL,
 FOREIGN KEY(id_brand_fk) REFERENCES tb_brands(id_brand)
 );
*/
#import "CarAcessor.h"

@implementation CarAcessor

+ (BOOL)saveNewCar:(Car *)carObject {
    NSString * query = [NSString stringWithFormat:@"INSERT INTO tb_cars(name, information, hp, id_brand_fk) VALUES('%@','%@',%f,%li)", carObject.name, carObject.information, carObject.hp, (long)carObject.fkBrand];
    
    return [DBManager executeQuery:query];
}

+ (NSArray *)getAllCars {
    NSMutableArray * resultArray = [[NSMutableArray alloc] init];
    
    NSString * query = @"SELECT id_car, name, information, hp, id_brand_fk FROM tb_cars";
    
    sqlite3_stmt * car_stmt = [DBManager executeStatement:query];
    
    while (sqlite3_step(car_stmt) == SQLITE_ROW) {
        Car* car = [[Car alloc] init];
        car.idCar = sqlite3_column_int(car_stmt, 0);
        car.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(car_stmt, 1)];
        car.information = [NSString stringWithUTF8String:(char *)sqlite3_column_text(car_stmt, 2)];
        car.hp = sqlite3_column_double(car_stmt, 3);
        car.fkBrand = sqlite3_column_int(car_stmt, 4);
        
        [resultArray addObject:car];
    }
    
    sqlite3_finalize(car_stmt);
    
    return resultArray;
}

+ (BOOL)parseCarResponse:(NSArray *)array {
    /*
     "id_car": 1,
     "name": "Gol",
     "information": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
     "hp": 50,
     "id_brand_fk":5
     */
    
    BOOL status = YES;
    
    for (NSDictionary* carDict in array) {
        Car* car = [[Car alloc] init];
        car.idCar = [carDict[@"id_car"] intValue];
        car.name = carDict[@"name"];
        car.information = carDict[@"information"];
        car.hp = [carDict[@"hp"] floatValue];
        car.fkBrand = [carDict[@"id_brand_fk"] intValue];
        
        status = [self saveNewCar:car];
    }
    
    return status;
}


+ (NSArray *)getCarsByBrand:(NSInteger)brandId {
    NSMutableArray * resultArray = [[NSMutableArray alloc] init];
    
    NSString * query = [NSString stringWithFormat: @"SELECT id_car, name, information, hp, id_brand_fk FROM tb_cars WHERE id_brand_fk = %li",(long)brandId];
    
    sqlite3_stmt * car_stmt = [DBManager executeStatement:query];
    
    while (sqlite3_step(car_stmt) == SQLITE_ROW) {
        Car* car = [[Car alloc] init];
        car.idCar = sqlite3_column_int(car_stmt, 0);
        car.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(car_stmt, 1)];
        car.information = [NSString stringWithUTF8String:(char *)sqlite3_column_text(car_stmt, 2)];
        car.hp = sqlite3_column_double(car_stmt, 3);
        car.fkBrand = sqlite3_column_int(car_stmt, 4);
        
        [resultArray addObject:car];
    }
    
    sqlite3_finalize(car_stmt);
    
    return resultArray;
}






















@end
