//
//  CommController.h
//  SmartLoginApp
//
//  Created by Shinichi Fujikawa on 2013/09/11.
//  Copyright (c) 2013年 sousousha,inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFJSONRequestOperation.h"
#import "LoginPolicy.h"


@interface WebAuthController


+(void)getSitePolicyWithUrlString:(NSString *)urlString parameters:(NSMutableDictionary *)parameters success:(void (^)(LoginPolicy* loginPolicy)) success
                       errorblock:(void (^)(NSError *error)) errorblock;

+(void)doRegisterServiceWithUrl:(NSString*)urlString idString:(NSString *)idString pasword:(NSString*)password params:(NSDictionary*)params  success:(void (^)(id obj))success failure:(void (^)(NSError * error))failure;

+(void)doLoginWithLoginUrl:(NSString*)urlString idString:(NSString *)idString password:(NSString*)password success:(void (^)(id obj))success failure:(void (^)(NSError * error))failure;


@end
