//
//  NSString+Appends.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 16.12.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#import "NSString+Appends.h"
#import "NSString+NilOrEmpty.h"
#import "NSString+Trim.h"

@implementation NSString (Appends)

- (NSString *) appendIfNotNilAndEmpty:(NSString *)value {
    NSString *result = nil;
    if (![NSString isNilOrEmpty:value]) {
        if ([NSString isEmpty:self]) {
            result = [self stringByAppendingString:value];
        }
    }
    
    return result;
}

- (NSString *) appendIfNotNil:(NSString *)value {
    NSString *result = nil;
    if (![NSString isNilOrEmpty:value]) {
        result = [value trimString];
        if (self.length > 0) {
            result = [NSString stringWithFormat:@" %@", result];
        }
        
        result = [self stringByAppendingString:result];
    }
    
    return result;
}

@end
