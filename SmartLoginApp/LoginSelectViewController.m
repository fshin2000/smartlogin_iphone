//
//  LoginSelectViewController.m
//  SmartLoginApp
//
//  Created by Shinichi Fujikawa on 2013/10/04.
//  Copyright (c) 2013年 sousousha,inc. All rights reserved.
//

#import "LoginSelectViewController.h"
#import "common_param.h"
#import "WebAuthController.h"
#import "LoginPolicy.h"
#import "LoginNavigationViewController.h"

@interface LoginSelectViewController (){
    
    LoginPolicy * _loginPolicy;
    
    NSString * g_pass ;
    NSString * g_id;
}


@end

@implementation LoginSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
 
    [_btnSegment addTarget:self action:@selector(selectSegment:)
          forControlEvents:UIControlEventValueChanged];

    _txtLogin.placeholder = @"Pleaser input your id";
    _txtPassword.placeholder = @"auto generated password";
    //[_txtLogin setText:@"Please input your id"];
    //[_txtPassword setText:@"auto generated password"] ;

    _txtLogin.delegate =self;
    _txtPassword.delegate = self;
    _txtLogin.returnKeyType = UIReturnKeyDone;
    _txtPassword.returnKeyType = UIReturnKeyDone;
    
    _loginPolicy = ((LoginNavigationViewController *)self.navigationController).loginPolicy;

    g_id = @"fshin2000";
    
    [_txtLogin setText:g_id];
    NSString * p = [self makePasswordWithColumnNumber:[_loginPolicy.passwdCountMax  intValue]];
    g_pass = p;
    
    [_txtPassword setText:g_pass];
    
    [_txtStatus setText:[_loginPolicy getString]];
    [_txtStatus setContentOffset:CGPointMake(0,0)];
    _txtStatus.textAlignment = NSTextAlignmentLeft;
    
    
}

-(NSString *)makePasswordWithColumnNumber:(int)number{
    
    NSString * dat = @"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNQOPQRSTUVWXYZ";

    NSMutableString * p = [[NSMutableString alloc]initWithString:@""];
    
    for (int i = 0 ; i < number ; i++){
        int r = arc4random() % 62;
        [p appendString:[dat substringWithRange:NSMakeRange(r,1)]];
    }
    
    return p;
    
}

- (void)selectSegment:(UISegmentedControl*)seg{
    // ここに何かの処理を記述する
    // （引数の seg には呼び出し元のUISegmentedControlオブジェクトが引き渡されてきます）
    switch (seg.selectedSegmentIndex){
        case 0:
            [_txtLogin setText:g_id];
            [_txtPassword setText:g_pass] ;
            break;
        case 1:
            [_txtLogin setText:g_id];
            [_txtPassword setText:g_pass];
            break;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBackPushed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)doLogin:(id)sender {

    NSString * loginUrl = _loginPolicy.loginUrl;
    [WebAuthController doLoginWithLoginUrl:loginUrl idString:_txtLogin.text password:_txtPassword.text success:^(id obj) {

        NSLog(@"login success");
        
        UIAlertView *alert =
        [[UIAlertView alloc]
         initWithTitle:@"Login Success"
         message:@"Login Success!! please enjoy!!"
         delegate:nil
         cancelButtonTitle:nil
         otherButtonTitles:@"OK", nil
         ];
        [alert show];
        
        
    } failure:^(NSError *error) {
        NSLog(@"login failed");

        UIAlertView *alert =
        [[UIAlertView alloc]
         initWithTitle:@"Login fail"
         message:@"Oh...Login fail."
         delegate:nil
         cancelButtonTitle:nil
         otherButtonTitles:@"OK", nil
         ];
        [alert show];
    }];
    

}

- (void)textFieldShouldReturn:(UITextField *)tf {

    if( [tf canResignFirstResponder] )
        [tf resignFirstResponder];

}


@end
