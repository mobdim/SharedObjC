//
//  NSString+bundleVersion.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 18.12.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#import "NSString+bundleVersion.h"

@implementation NSString (bundleVersion)

+ (NSString *) bundleVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *) bundleShortVersionString {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

@end
