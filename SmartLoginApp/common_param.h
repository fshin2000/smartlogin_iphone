//
//  common_param.h
//  SmartLoginApp
//
//  Created by Shinichi Fujikawa on 2013/10/04.
//  Copyright (c) 2013年 sousousha,inc. All rights reserved.
//

//
//  common_param.h
//  ShopCardme
//
//  Created by Shinichi Fujikawa on 2013/02/25.
//  Copyright (c) 2013年 sousousha,inc. All rights reserved.
//

#define SCREEN_BOUNDS   ([UIScreen mainScreen].bounds)
#define LOG(A, ...) NSLog(@"DEBUG: %s:%d:%@", __PRETTY_FUNCTION__,__LINE__,[NSString stringWithFormat:A, ## __VA_ARGS__]);
#define LOGF(A, ...) NSLog(@"DEBUG: %s:%d:%f", __PRETTY_FUNCTION__,__LINE__,## __VA_ARGS__);
#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBA(r, g, b, a)    [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define NEXT_Y(obj)  obj.frame.origin.y + obj.frame.size.height
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define LANGUAGE    ([NSLocale preferredLanguages][0])
//角度→ラジアン変換
#if !defined(RADIANS)
#define RADIANS(D) (D * M_PI / 180)
#endif

