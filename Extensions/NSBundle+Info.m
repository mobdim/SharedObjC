//
//  NSBundle+Info.m
//  ipPort
//
//  Created by Dmitriy Zadoroghnyy on 14/05/15.
//  Copyright (c) 2015 ipPort. All rights reserved.
//

#import "NSBundle+Info.h"

@implementation NSBundle (Info)

- (NSString *)name {
    return [[self infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

@end
