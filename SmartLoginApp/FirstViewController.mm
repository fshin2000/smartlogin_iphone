//
//  FirstViewController.m
//  SmartLoginApp
//
//  Created by Shinichi Fujikawa on 2013/08/26.
//  Copyright (c) 2013年 sousousha,inc. All rights reserved.
//

#import "FirstViewController.h"
#import "WebAuthController.h"
#import "LoginPolicy.h"
#import "LoginNavigationViewController.h"

@interface FirstViewController (){
    
    LoginPolicy * _loginPolocy;
    QRReaderViewController *_qrReader;
    
}

@end

@implementation FirstViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (IBAction)btnQRCodePushed:(id)sender {
    
    _qrReader = [[QRReaderViewController alloc]init];
    _qrReader.delegate = self;
    [self addChildViewController:_qrReader];
    
    [_qrReader viewDidLoad];
    
}

-(void)qrStringReadComplete:(NSString *)qrString{
    
    
    [_qrReader removeFromParentViewController];
    _qrReader = nil;
    
    
    [WebAuthController getSitePolicyWithUrlString:qrString parameters:nil success:^(LoginPolicy * loginPolicy) {
        
        _loginPolocy = loginPolicy;
        NSLog(@"%@" , loginPolicy);
        //LoginNavigationViewController *nav = [[LoginNavigationViewController alloc]init];
        [self performSegueWithIdentifier:@"LoginNav" sender:self];
        
    } errorblock:^(NSError *error) {
        
        NSLog(@"%@" , error);
        
    }];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Segueの特定
    if ( [[segue identifier] isEqualToString:@"LoginNav"] ) {
        LoginNavigationViewController *nextViewController = [segue destinationViewController];
        //ここで遷移先ビューのクラスの変数receiveStringに値を渡している
        nextViewController.loginPolicy = _loginPolocy;
        
        nextViewController = nil;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
