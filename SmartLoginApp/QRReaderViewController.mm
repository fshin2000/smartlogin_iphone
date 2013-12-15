//
//  QRReaderViewController.m
//  SmartLoginApp
//
//  Created by Shinichi Fujikawa on 2013/09/11.
//  Copyright (c) 2013年 sousousha,inc. All rights reserved.
//

#import "QRReaderViewController.h"


@interface QRReaderViewController ()

@end

@implementation QRReaderViewController

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
    
    
    ZXingWidgetController *zwc = [[ZXingWidgetController alloc] initWithDelegate:self showCancel:YES OneDMode:NO];
    QRCodeReader *qrcodeReader = [[QRCodeReader alloc] init];
    NSSet *readers = [[NSSet alloc] initWithObjects:qrcodeReader, nil];
    zwc.readers = readers;
    [self presentModalViewController:zwc animated:YES];
    
}

-(void)zxingControllerDidCancel:(ZXingWidgetController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)zxingController:(ZXingWidgetController *)controller didScanResult:(NSString *)result
{
    NSNumber *cardId;
    NSNumber * friendId;
    bool isValid = false;
    
    [self dismissViewControllerAnimated:YES completion:^{
        if (_delegate){
            [_delegate qrStringReadComplete:result];
        }
    }];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
