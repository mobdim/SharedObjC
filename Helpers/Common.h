//
//  Common.h
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 07.11.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#ifndef ipPort_New_Common_h
#define ipPort_New_Common_h

#define GetDelegate(del)   AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate

#define CHECK(val)              NSAssert((val), @#val)
#define CHECKCLASS(val, cl)     CHECK([val isKindOfClass:[cl class]])

#define isPhone568                  ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568)
#define iPhone568ImageNamed(image)  (isPhone568 ? [NSString stringWithFormat:@"%@-568h.%@", [image stringByDeletingPathExtension], [image pathExtension]] : image)
#define iPhone568Image(image)       ([UIImage imageNamed:iPhone568ImageNamed(image)])

#import "DDLog.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"

extern int const ddLogLevel;

#endif
