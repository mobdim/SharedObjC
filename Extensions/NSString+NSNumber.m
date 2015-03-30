//
//  NSString+NSNumber.m
//  ipPort
//
//  Created by Dmitriy Zadoroghniy on 12.01.15.
//  Copyright (c) 2015 ipPort. All rights reserved.
//

#import "NSString+NSNumber.h"

@implementation NSString (NSNumber)

- (NSNumber *)number {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *n = [f numberFromString:self];
    
    return n;
}

- (NSNumber *)floatNumber {
    NSString *balance = nil;
    if ([self isKindOfClass:[NSNumber class]]) {
        balance = [(NSNumber *)self stringValue];
    } else {
        balance = self;
    }
    NSString *s = [balance stringByReplacingOccurrencesOfString:@"," withString:@"."];
    
    return [NSNumber numberWithFloat:[s floatValue]];
}


@end
