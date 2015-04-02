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
    NSString * query = [NSString stringWithFormat:@"INSERT INTO tb_brands(name, isFancy) VALUES('%@',%i)", brandObject.name, brandObject.isFancy];
    
   return [DBManager executeQuery:query];
    
}

+ (NSArray *) getAllBrands{
    NSMutableArray * resultArray = [[NSMutableArray alloc] init];
    
    NSString * query = @"SELECT id_brand, name, isFancy FROM tb_brands";
    
    sqlite3_stmt * brand_stmt = [DBManager executeStatement:query];
    
    while (sqlite3_step(brand_stmt) == SQLITE_ROW) {
        Brand* brand = [[Brand alloc] init];
        brand.idBrand = sqlite3_column_int(brand_stmt, 0);
        brand.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(brand_stmt, 1)];
        brand.isFancy = sqlite3_column_int(brand_stmt, 2);
        
        [resultArray addObject:brand];
    }
    
    sqlite3_finalize(brand_stmt);
    
    return resultArray;
}

@end
