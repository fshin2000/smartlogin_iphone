//
//  NSString+Util.m
//  SmartLoginApp
//
//  Created by Shinichi Fujikawa on 2013/10/08.
//  Copyright (c) 2013年 sousousha,inc. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString(Util)

+(id)NullReplace:(id)inputString{
    
    if (inputString == nil){
        return @"";
    }
    return inputString;
}

@end

