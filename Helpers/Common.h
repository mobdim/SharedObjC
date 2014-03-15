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
#define CHECKSAVE(val)          {                                                                        \
                                    switch (val) {                                                       \
                                        case FCModelSaveFailed:                                          \
                                            DDLogError(@"(%d) - FCModelSaveResult Failed!", val);        \
                                            break;                                                       \
                                        case FCModelSaveRefused:                                         \
                                            DDLogError(@"(%d) - FCModelSaveResult Refused!", val);       \
                                            break;                                                       \
                                        case FCModelSaveNoChanges:                                       \
                                            DDLogVerbose(@"(%d) - FCModelSaveResult NoChanges!", val);   \
                                            break;                                                       \
                                        case FCModelSaveSucceeded:                                       \
                                            DDLogVerbose(@"(%d) - FCModelSaveResult Succeeded!", val);   \
                                            break;                                                       \
                                        default:                                                         \
                                        break;                                                           \
                                    }                                                                    \
                                }

#define length(x) (sizeof(x) / sizeof(*(x)))
#define STRINGREF2NSSTRING(ref)     (ref) ? [NSString stringWithFormat:@"%@", (__bridge_transfer NSString*)ref] : @""
#define CFRELEASEIFNOTNULL(ref)     if (ref != NULL) CFRelease(ref)

#define isPhone568                  ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568)
#define iPhone568ImageNamed(image)  (isPhone568 ? [NSString stringWithFormat:@"%@-568h.%@", [image stringByDeletingPathExtension], [image pathExtension]] : image)
#define iPhone568Image(image)       ([UIImage imageNamed:iPhone568ImageNamed(image)])
#define iPhone568ImageNamed2x(image)  (isPhone568 ? [NSString stringWithFormat:@"%@-568h@2x.%@", [image stringByDeletingPathExtension], [image pathExtension]] : image)
#define iPhone568Image2x(image)       ([UIImage imageNamed:iPhone568ImageNamed2x(image)])

#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define __DESCRIPTION_ALL_PROPERTIES                                                                                                \
                                                                                                                                    \
- (NSArray *)__allPropertyNames                                                                                                     \
{                                                                                                                                   \
    unsigned count;                                                                                                                 \
    objc_property_t *properties = class_copyPropertyList([self class], &count);                                                     \
                                                                                                                                    \
    NSMutableArray *rv = [NSMutableArray array];                                                                                    \
                                                                                                                                    \
    unsigned i;                                                                                                                     \
    for (i = 0; i < count; i++)                                                                                                     \
    {                                                                                                                               \
        objc_property_t property = properties[i];                                                                                   \
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];                                                \
        [rv addObject:name];                                                                                                        \
    }                                                                                                                               \
                                                                                                                                    \
    free(properties);                                                                                                               \
                                                                                                                                    \
    return rv;                                                                                                                      \
}                                                                                                                                   \
                                                                                                                                    \
- (NSString *)description {                                                                                                         \
    NSMutableString *d = [NSMutableString new];                                                                                     \
    NSArray *properties = [self __allPropertyNames];                                                                                \
    for (NSString *property in properties) {                                                                                        \
        NSString *tab = [@"" stringByPaddingToLength:10 withString:@" " startingAtIndex:0];                                         \
        NSString *value = [NSString stringWithFormat:@"%@", [self valueForKey:property]];                                           \
        [d appendFormat:@"\r%@%@ = %@", tab, [property stringByPaddingToLength:20 withString:@" " startingAtIndex:0], value];       \
    }                                                                                                                               \
                                                                                                                                    \
    return [[super description] stringByAppendingString:d];                                                                         \
}



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

// ******* Includes ---

#import <objc/runtime.h>

#define kNetworkMaxRequestCount 3

#endif
