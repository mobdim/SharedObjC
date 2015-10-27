//
//  NSString+NilOrEmpty.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 04.12.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#import "NSString+NilOrEmpty.h"

@implementation NSString (NilOrEmpty)

+ (BOOL) isNil:(NSString *)string {
    if ((string == nil) || (string == (id)[NSNull null])) return YES;
    
    return NO;
}

+ (BOOL) isEmpty:(NSString *)string {
    return ([string length] == 0);
}

+ (BOOL) isNilOrEmpty:(NSString *)string {
    if ((string == nil) || (string == (id)[NSNull null])) return YES;
    
    if ([string length] == 0) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isEmpty {
    return self.length == 0;
}


@end
