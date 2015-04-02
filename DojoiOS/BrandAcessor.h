//
//  BrandAcessor.h
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/31/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Brand.h"
#import "DBManager.h"
#import <sqlite3.h>

@interface BrandAcessor : NSObject

+ (BOOL) saveNewBrand:(Brand *) brandObject;
+ (NSArray *) getAllBrands;

@end
