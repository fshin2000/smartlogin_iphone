//
//  LoginNavigationViewController.h
//  SmartLoginApp
//
//  Created by Shinichi Fujikawa on 2013/10/04.
//  Copyright (c) 2013年 sousousha,inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginPolicy.h"

@interface LoginNavigationViewController : UINavigationController


@property (strong, nonatomic) LoginPolicy * loginPolicy;


@end
