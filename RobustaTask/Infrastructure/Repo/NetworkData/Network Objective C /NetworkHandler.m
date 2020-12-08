//
//  NetworkHandler.m
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/8/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

#import "NetworkHandler.h"

@implementation NetworkHandler


// This function(getJsonArrayResponse) is to get data is Response is array base
//ex
/*
 [
    "data" : {
    
    }
 
 ]
 */

+(void)getJsonArrayResponse:(NSString *)urlStr success:(void (^)(NSMutableArray *responseDict))success failure:(void(^)(NSError* error))failure
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:urlStr];

    // Asynchronously API is hit here
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                NSLog(@"%@",data);
                                                if (error)
                                                    failure(error);
                                                else {
                                                    NSMutableArray *json  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                                    NSLog(@"%@",json);
                                                    //NSDictionary *first = [json objectAtIndex:0];
                                                    success(json);
                                                }
                                            }];
    [dataTask resume];    // Executed First
}

// This function(getJsonObjectResponse) is to get data is Response is object base
//ex
/*
 {
    "data" : {
    
    }
 
 }
 */

+(void)getJsonObjectResponse:(NSString *)urlStr success:(void (^)(NSDictionary *responseDict))success failure:(void(^)(NSError* error))failure {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:urlStr];

    // Asynchronously API is hit here
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                NSLog(@"%@",data);
                                                if (error)
                                                    failure(error);
                                                else {
                                                    NSDictionary *json  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                    NSLog(@"%@",json);
                                                    //NSDictionary *first = [json objectAtIndex:0];
                                                    success(json);
                                                }
                                            }];
    [dataTask resume];    // Executed First

    
    
}

@end
