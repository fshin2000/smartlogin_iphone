//
//  LoginPolicy.m
//  SmartLoginApp
//
//  Created by Shinichi Fujikawa on 2013/09/11.
//  Copyright (c) 2013年 sousousha,inc. All rights reserved.
//

#import "LoginPolicy.h"

#import "NSString+Util.h"

@implementation LoginPolicy


-(NSString*)getString{

    NSString *p = [NSString stringWithFormat:
@"Domain:%@\n\
Lang:%@\n\
Login Url:%@\n\
Login Usable Character:%@\n\
MailAddressRequired:%@\n\
idType:%@\n\
password count max : %@\n\
password count min : %@\n\
version : %@\n\
register url : %@\n\
service description : %@\n\
service icon : %@\n\
service name : %@\n\
term url : %@\n\
user icon height : %@\n\
user icon width : %@\n\
user icon required : %@\n\
"
                   , [NSString NullReplace:_domain]
                   , [NSString NullReplace:_lang]
                   ,[NSString NullReplace:_loginUrl]
                   ,[NSString NullReplace:_loginUsableCharacter]
                   ,[NSString NullReplace:_mailAddressReuired]
                   ,[NSString NullReplace:_idType]
                   ,[NSString NullReplace:_passwdCountMax]
                   ,[NSString NullReplace:_passwdCountMin]
                   ,[NSString NullReplace:_version]
                   ,[NSString NullReplace:_registerUrl]
                   ,[NSString NullReplace:_serviceDescription]
                   ,[NSString NullReplace:_serviceIcon]
                   ,[NSString NullReplace:_serviceName]
                   ,[NSString NullReplace:_termUrl]
                   ,[NSString NullReplace:_userIconHeight]
                   ,[NSString NullReplace:_userIconWidth]
                   ,[NSString NullReplace:_userIconRequired]
                   ];
    
    return p;

    
}



@end
