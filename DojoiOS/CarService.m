//
//  CarService.m
//  DojoiOS
//
//  Created by Gustavo Gardenal Barbosa on 3/31/15.
//  Copyright (c) 2015 ciandt. All rights reserved.
//

#import "CarService.h"

@implementation CarService

+ (void)responseFromWebServiceWithCompletionBlock:(void(^)(BOOL success, NSError *error)) completion {
    
    NSURL * url = [[NSURL alloc] initWithString:@"https://private-c23ad-dojoios.apiary-mock.com/notes"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:10];
    
    NSURLSession * session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        BOOL status = NO;

        if (!error){
            NSHTTPURLResponse *httpRespose = (NSHTTPURLResponse *)response;
            NSError * jsonError;
            
            if (httpRespose.statusCode == 200){
                NSDictionary * jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
                
                if (!jsonError) {
                    status = [CarAcessor parseCarResponse:[jsonDict objectForKey:@"cars"]];
                }
            }
        }
        completion(status, error);
    }];
    
    [dataTask resume];
}


@end
