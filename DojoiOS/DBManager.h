//
//  DBManager.h
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/24/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject

//Create database
+ (BOOL)createDB;

//Execute query for INSERT, UPDATE or DELETE. Operations that doesn't need to be parsed.
+ (BOOL)executeQuery:(NSString *)query;
+ (sqlite3_stmt *)executeStatement:(NSString *)query;

@end
