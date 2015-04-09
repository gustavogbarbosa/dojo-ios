//
//  BrandAcessor.m
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/31/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import "BrandAcessor.h"

@implementation BrandAcessor


//CREATE TABLE IF NOT EXISTS tb_brands
//(
// id_brand INTEGER NOT NULL PRIMARY KEY,
// name TEXT,
// isFancy INTEGER DEFAULT '0' NOT NULL
// );

+ (BOOL) saveNewBrand:(Brand *) brandObject{
    NSString * query = [NSString stringWithFormat:@"INSERT INTO tb_brands(name, isFancy, active) VALUES('%@',%i, %i)", brandObject.name, brandObject.isFancy, brandObject.isActive];
    
    return [DBManager executeQuery:query];
    
}

+ (NSArray *) getAllBrands{
    NSMutableArray * resultArray = [[NSMutableArray alloc] init];
    
    NSString * query = @"SELECT id_brand, name, isFancy, active FROM tb_brands";
    
    sqlite3_stmt * brand_stmt = [DBManager executeStatement:query];
    
    while (sqlite3_step(brand_stmt) == SQLITE_ROW) {
        Brand* brand = [[Brand alloc] init];
        brand.idBrand = sqlite3_column_int(brand_stmt, 0);
        brand.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(brand_stmt, 1)];
        brand.isFancy = sqlite3_column_int(brand_stmt, 2);
        brand.isActive = sqlite3_column_int(brand_stmt, 3);
        
        [resultArray addObject:brand];
    }
    
    sqlite3_finalize(brand_stmt);
    
    return resultArray;
}

@end
