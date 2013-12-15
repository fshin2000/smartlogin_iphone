//
//  LoginSelectViewController.h
//  SmartLoginApp
//
//  Created by Shinichi Fujikawa on 2013/10/04.
//  Copyright (c) 2013年 sousousha,inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginSelectViewController : UIViewController<UITextFieldDelegate>
- (IBAction)btnBackPushed:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *txtStatus;
@property (strong, nonatomic) IBOutlet UISegmentedControl *btnSegment;
@property (strong, nonatomic) IBOutlet UITextField *txtLogin;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)doLogin:(id)sender;

@end
