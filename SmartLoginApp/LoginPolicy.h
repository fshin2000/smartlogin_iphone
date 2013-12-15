//
//  LoginPolicy.h
//  SmartLoginApp
//
//  Created by Shinichi Fujikawa on 2013/09/11.
//  Copyright (c) 2013年 sousousha,inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginPolicy : NSObject

@property (retain,nonatomic) NSString* domain ;
@property (retain,nonatomic) NSString* lang ;
@property (retain,nonatomic) NSString* loginUrl ;
@property (retain,nonatomic) NSString* loginUsableCharacter ;
@property (retain,nonatomic) NSNumber * mailAddressReuired ;

@property (retain , nonatomic) NSString * idType;
@property (retain,nonatomic) NSNumber* passwdCountMax ;
@property (retain,nonatomic) NSNumber* passwdCountMin ;
@property (retain,nonatomic) NSNumber* version ;
@property (retain,nonatomic) NSString* registerUrl ;
@property (retain,nonatomic) NSString* serviceDescription ;
@property (retain,nonatomic) NSString* serviceIcon ;
@property (retain,nonatomic) NSString* serviceName ;
@property (retain,nonatomic) NSString* termUrl ;
@property (retain,nonatomic) NSNumber* userIconHeight ;
@property (retain,nonatomic) NSNumber* userIconWidth ;
@property (retain,nonatomic) NSNumber* userIconRequired ;


-(NSString*) getString;


@end
