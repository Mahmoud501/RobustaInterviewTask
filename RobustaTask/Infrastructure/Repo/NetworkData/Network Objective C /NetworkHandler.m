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
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60];
    // Asynchronously API is hit here
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                NSLog(@"%@",data);
                                                if (error)
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        failure(error);
                                                    });

                                                else {
                                                    NSMutableArray *json  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                                    NSLog(@"%@",json);
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        success(json);
                                                    });
                                                    //NSDictionary *first = [json objectAtIndex:0];
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
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60];

    // Asynchronously API is hit here
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:request
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                NSLog(@"%@",data);
                                                if (error)

                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        failure(error);
                                                    });

                                                    else {
                                                    NSDictionary *json  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                    NSLog(@"%@",json);
                                                    //NSDictionary *first = [json objectAtIndex:0];
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            success(json);
                                                        });

                                                    }
                                            }];
    [dataTask resume];    // Executed First

    
    
}

@end
