//
//  Brand.h
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/31/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Brand : NSObject

@property (nonatomic, assign) NSInteger idBrand;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL isFancy;
@property (nonatomic, assign) BOOL isActive;

@end
