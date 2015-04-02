//
//  DBManager.m
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/24/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import "DBManager.h"


@implementation DBManager

static sqlite3* database;
static DBManager* sharedInstance;

+ (BOOL)openDB {
    
    if (sqlite3_open([[DBManager databasePath] UTF8String], &database) == SQLITE_OK){
        return YES;
    }
    return NO;
}

+ (void)closeDB {
    if (sqlite3_open([[DBManager databasePath] UTF8String], &database) == SQLITE_OK){
        sqlite3_close(database);
    }
}

+ (BOOL)createDB {
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Script" ofType:@"sql"];
    
    NSString* query = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    BOOL isSuccess = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if (![filemgr fileExistsAtPath:[self databasePath]])
    {
        const char *dbpath = [[self databasePath] UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
        {
            char *errMsg;
            if (sqlite3_exec(database, [query UTF8String], NULL, NULL, &errMsg)
                != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table");
            }
            sqlite3_close(database);
            
            isSuccess = YES;
        }
        else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
        }
    } else {
        isSuccess = NO;
        NSLog(@"Database already exists");
    }
    
    return isSuccess;
}

+ (NSString*)databasePath {
    
    NSString *docsDir;
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // Get the documents directory
    docsDir = dirPaths[0];
    // Build the path to the database file
    NSString* databasePath = [docsDir stringByAppendingPathComponent:@"database.db"];
    
    NSLog(@"%@", databasePath);
    
    return databasePath;
}


+ (sqlite3_stmt *)executeStatement:(NSString *)query {
    
    sqlite3_stmt *statement = nil;
    
    if ([self openDB]) {
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil)==SQLITE_OK) {
            return statement;
            
        } else {
            
            NSLog(@"SQL Error is %s",sqlite3_errmsg(database));
            if(statement != nil){
                sqlite3_finalize(statement);
            }
            
            return nil;
        }
    }
    
    [self closeDB];
    
    return statement;
}

+ (BOOL)executeQuery:(NSString *)query {
    
    BOOL success = YES;
    
    if ([self openDB]){
        
        NSLog(@"%@", query);
        
        const char *sql = [query UTF8String];
        
        sqlite3_stmt *stmt = [self executeStatement:query];
        
        if(sqlite3_prepare_v2(database, sql, -1, &stmt, NULL) != SQLITE_OK)
        {
            success = NO;
        }
        if (SQLITE_DONE != sqlite3_step(stmt)){
            NSLog(@"Error while creating database. '%s'", sqlite3_errmsg(database));
        }
        
        sqlite3_finalize(stmt);
    }
    else{
        //NSAssert1(0, @"Error while opening database '%s'", sqlite3_errmsg(database));
    }
    
    [self closeDB];
    
    return YES;
}

@end