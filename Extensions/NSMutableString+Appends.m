//
//  NSMutableString+Appends.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 16.12.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#import "NSMutableString+Appends.h"
#import "NSString+NilOrEmpty.h"
#import "NSString+Trim.h"

@implementation NSMutableString (Appends)

- (void) appendIfNotNilAndEmpty:(NSString *)value {
    if (![NSString isNilOrEmpty:value]) {
        if ([NSString isEmpty:self]) {
            [self appendString:value];
        }
    }
}

- (void) appendIfNotNil:(NSString *)value {
    NSString *tmp = nil;
    if (![NSString isNilOrEmpty:value]) {
        tmp = [value trimString];
        if (self.length > 0) {
            tmp = [NSString stringWithFormat:@" %@", tmp];
        }
        
        [self appendString:tmp];
    }
}

@end
