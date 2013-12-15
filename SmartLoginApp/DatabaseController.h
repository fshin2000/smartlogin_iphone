//
//  DatabaseController.h
//  SmartLoginApp
//
//  Created by Shinichi Fujikawa on 2013/09/11.
//  Copyright (c) 2013年 sousousha,inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

/*注意：未使用 */

@interface DatabaseController : NSObject

+ (DatabaseController *)sharedController;


-(void)initDatabase:(void (^)(int errcode , NSString* errMessage)) errorblock
       successblock:(void (^)()) successblock;

-(void)addPoclicyFile:(NSString*)domain serviceName:(NSString *)serviceName lang:(NSString*)lang version:(float)version policyJson:(NSString*)policyJson;



@end
