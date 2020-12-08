//
//  NetworkHandler.h
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/8/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkHandler : NSObject

+(void)getJsonArrayResponse:(NSString *)urlStr success:(void (^)(NSMutableArray *responseDict))success failure:(void(^)(NSError* error))failure;

+(void)getJsonObjectResponse:(NSString *)urlStr success:(void (^)(NSDictionary *responseDict))success failure:(void(^)(NSError* error))failure;



@end

NS_ASSUME_NONNULL_END
