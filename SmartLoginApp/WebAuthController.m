//
//  CommController.m
//  SmartLoginApp
//
//  Created by Shinichi Fujikawa on 2013/09/11.
//  Copyright (c) 2013年 sousousha,inc. All rights reserved.
//

#import "WebAuthController.h"

@implementation WebAuthController

+(void)getSitePolicyWithUrlString:(NSString *)urlString parameters:(NSMutableDictionary *)parameters success:(void (^)(LoginPolicy* loginPolicy)) success
                       errorblock:(void (^)(NSError *error)) errorblock;{

    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id jsonObject) {
        
        NSLog(@"%@" , jsonObject);
        if (jsonObject){
            
            if (jsonObject == nil){
                NSMutableDictionary* errDetails = [NSMutableDictionary dictionary];
                [errDetails setValue:@"response data is null" forKey:NSLocalizedDescriptionKey];
                NSError *errorObj = [NSError errorWithDomain:@"api" code:201 userInfo:errDetails];
                if (errorblock){
                    errorblock(errorObj);
                }
                return;
            }
                        
            LoginPolicy * lp = [[LoginPolicy alloc]init];
            lp.domain = [jsonObject valueForKeyPath:@"domain"];
            
            if (lp.domain ==nil){
                NSMutableDictionary* errDetails = [NSMutableDictionary dictionary];
                [errDetails setValue:@"response data is empty" forKey:NSLocalizedDescriptionKey];
                NSError *errorObj = [NSError errorWithDomain:@"api" code:202 userInfo:errDetails];
                if (errorblock){
                    errorblock(errorObj);
                }
                return;
            }
            
            lp.lang = [jsonObject valueForKey:@"lang"];
            NSString * pv  = [jsonObject valueForKey:@"policy_version"];
            if (pv != nil)
                lp.version = [NSNumber numberWithFloat:[pv floatValue]];
            
            lp.loginUrl = [jsonObject valueForKey:@"login_url"];
            lp.loginUsableCharacter = [jsonObject valueForKey:@"login_usable_character"];
            lp.idType = [jsonObject valueForKey:@"id_type"];
            NSString * pass_max = [jsonObject valueForKey:@"passwd_count_max"];
            NSString * pass_min = [jsonObject valueForKey:@"passwd_count_min"];
            if (pass_max != nil)
                lp.passwdCountMax = [NSNumber numberWithInt:[pass_max intValue]];
            if (pass_min != nil)
                lp.passwdCountMin = [NSNumber numberWithInt:[pass_min intValue]];
            
            lp.registerUrl = [jsonObject valueForKey:@"register_url"];
            lp.serviceDescription = [jsonObject valueForKey:@"service_description"];
            lp.serviceIcon = [jsonObject valueForKey:@"service_icon"];
            lp.serviceName = [jsonObject valueForKey:@"service_name"];
            lp.termUrl = [jsonObject valueForKey:@"term_url"];
            NSString * mailAddressRequired = [jsonObject valueForKey:@"mail_address_required"];
            NSString * iconHeight = [jsonObject valueForKey:@"user_icon_height"];
            NSString * iconWidth = [jsonObject valueForKey:@"user_icon_width"];
            NSString * iconRequired = [jsonObject valueForKey:@"user_icon_required"];
            
            if (mailAddressRequired != nil){
                if ([[mailAddressRequired lowercaseString] isEqualToString:@"yes"])
                    lp.mailAddressReuired = @1;
                else
                    lp.mailAddressReuired = @0;
            }
            
            if (iconHeight != nil)
                lp.userIconHeight = [NSNumber numberWithInt:[iconHeight intValue]];
            if (iconWidth != nil)
                lp.userIconWidth = [NSNumber numberWithInt:[iconWidth intValue]];
            
            if (iconRequired != nil){
                if ([[iconRequired lowercaseString] isEqualToString:@"yes"])
                    lp.userIconRequired = @1;
                else
                    lp.userIconRequired = @0;
            }
            
            if (success){
                success(lp);
            }
        }
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {

        
        NSMutableDictionary* errDetails = [NSMutableDictionary dictionary];
        [errDetails setValue:@"network error" forKey:NSLocalizedDescriptionKey];
        NSError *errorObj = [NSError errorWithDomain:@"api" code:203 userInfo:errDetails];
        if (errorblock){
            errorblock(errorObj);
        }
        return;
        
        //NSLog(@"%@" , JSON);
        //NSLog(@"%@" , error);
        
    }];
    [operation start];
    
}

+(void)doLoginWithLoginUrl:(NSString*)urlString idString:(NSString *)idString password:(NSString*)password success:(void (^)(id obj))success failure:(void (^)(NSError * error))failure{
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSString *body = [NSString stringWithFormat:@"login_id=%@&password=%@", idString, password];
    // HTTPBodyには、NSData型で設定する
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        // JSON変数はNSDictionaryかNSArrayにパース済み
        
        if (success){
            success(nil);
        }
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        
        if (failure){
            failure(error);
        }
        
        
    }];
    [operation start];
    
}

+(void)doRegisterServiceWithUrl:(NSString*)urlString idString:(NSString *)idString pasword:(NSString*)password params:(NSDictionary*)params  success:(void (^)(id obj))success failure:(void (^)(NSError * error))failure{

    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    [request setValue:idString forKey:@"id"];
    [request setValue:password forKey:@"password"];
    
    for(NSString* key in params.allKeys){
        [request setValue:[params valueForKey:key]  forKey:key];
    }
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        
        
    }];
    [operation start];
    
}



@end
