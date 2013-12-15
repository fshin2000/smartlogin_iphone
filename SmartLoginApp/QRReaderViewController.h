//
//  QRReaderViewController.h
//  SmartLoginApp
//
//  Created by Shinichi Fujikawa on 2013/09/11.
//  Copyright (c) 2013年 sousousha,inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXingWidgetController.h"
#import "QRCodeReader.h"

@protocol QRReaderViewDelegate

-(void)qrStringReadComplete:(NSString*)qrString;

@end

@interface QRReaderViewController : UIViewController < ZXingDelegate >

@property (assign,nonatomic) id<QRReaderViewDelegate> delegate;


@end
