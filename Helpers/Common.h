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

// ******* Tests +++

// Macro - Set the flag for block completion
#define StartBlock() __block BOOL waitingForBlock = YES

// Macro - Set the flag to stop the loop
#define EndBlock() waitingForBlock = NO

// Macro - Wait and loop until flag is set
#define WaitUntilBlockCompletes() WaitWhile(waitingForBlock)

// Macro - Wait for condition to be NO/false in blocks and asynchronous calls
// Each test should have its own instance of a BOOL condition because of non-thread safe operations
#define WaitWhile(condition) \
do { \
while(condition) { \
[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]]; \
} \
} while(0)

// ******* Tests ---

#import "DDLog.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"

extern int const ddLogLevel;

#endif
