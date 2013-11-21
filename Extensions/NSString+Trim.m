//
//  NSString+Trim.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 19.11.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#import "NSString+Trim.h"

@implementation NSString (Trim)

- (NSString *) trimString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
