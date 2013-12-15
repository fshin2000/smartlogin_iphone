//
//  DatabaseController.m
//  SmartLoginApp
//
//  Created by Shinichi Fujikawa on 2013/09/11.
//  Copyright (c) 2013年 sousousha,inc. All rights reserved.
//

#import "DatabaseController.h"

/*注意：未使用 */

@interface DatabaseController(){
    
    NSString * _dbFilename;
    
}
@end

@implementation DatabaseController

+ (DatabaseController *)sharedController {
    
    static DatabaseController *_sharedDBController = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDBController = [[DatabaseController alloc] init];
    });
    return _sharedDBController;
}

-(id) init{
    self = [super init];
    if (self != nil) {
    }
    return self;
}

-(void)initDatabase:(void (^)(int errcode , NSString* errMessage)) errorblock
       successblock:(void (^)()) successblock
{
    
    NSArray*    paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString*   dir   = [paths objectAtIndex:0];
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    _dbFilename = [dir stringByAppendingPathComponent:@"smartlog.db"];
    
    if (![fileManager fileExistsAtPath:_dbFilename]){
        FMDatabase* db    = [FMDatabase databaseWithPath:_dbFilename];
        [db open];
        
        if(![db open]) {
            if (errorblock){
                errorblock(1 , @"db open error");
            }
        }

        NSString* sql1 = @"CREATE TABLE IF NOT EXISTS sites (id INTEGER PRIMARY KEY AUTOINCREMENT , domain TEXT , lang TEXT , version REAL  , service_name TEXT ,  service_desription TEXT , service_icon TEXT, json TEXT ,  created_at datetime , updated_at datetime); ";
        [self execiteSimpleSQLWithTransaction:db sql:sql1 errorblock:errorblock];

        NSString * sql2 = @"CREATE TABLE IF NOT EXISTS accounts(id INTEGER PRIMARY KEY AUTOINCREMENT , domain TEXT , lang TEXT , version REAL , user_id INTEGER  , login_id TEXT , login_password TEXT  ,  created_at datetime , updated_at datetime); ";
        [self execiteSimpleSQLWithTransaction:db sql:sql2 errorblock:errorblock];
        
        NSString * sql3 = @"CREATE TABLE IF NOT EXISTS users(id INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT , login_id TEXT , icon_filename TEXT  ,  mail_address TEXT , created_at datetime , updated_at datetime); ";
        [self execiteSimpleSQLWithTransaction:db sql:sql3 errorblock:errorblock];
        
        [db close];
        
        if (successblock){
            successblock();
        }
        
        
    }else{
        
        if (successblock){
            successblock();
        }
    }
}

-(void)storeSitePolicy:(NSString*)domain lang:(NSString*)lang version:(float)version serviceName:(NSString*)serviceName serviceDescription:(NSString*)serviceDescription {
    
    
}


-(void)execiteSimpleSQLWithTransaction:(FMDatabase*) opendb  sql:(NSString *)sql errorblock:(void (^)(int errcode , NSString* errMessage)) errorblock
{
    [opendb beginTransaction];
    [opendb executeUpdate:sql];
    
    if ([opendb hadError]) {
        NSString *errString = [NSString stringWithFormat:@"Err %d: %@", [opendb lastErrorCode], [opendb lastErrorMessage]];
        [opendb rollback];
        if (errorblock){
            errorblock(2, errString);
        }
    } else {
        [opendb commit];
    }
    
}


@end
