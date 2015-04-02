//
//  CarService.h
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/31/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarAcessor.h"

@interface CarService : NSObject

+ (void)responseFromWebServiceWithCompletionBlock:(void(^)(BOOL success, NSError *error)) completion;

@end
