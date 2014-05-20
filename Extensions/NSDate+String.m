//
//  NSDate+String.m
//  epiphone
//
//  Created by Dmitriy Zadoroghnyy on 13.05.14.
//  Copyright (c) 2014 Dmitriy Zadoroghnyy. All rights reserved.
//

#import "NSDate+String.h"

@implementation NSDate (String)

- (NSString *)stringFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    [formatter setLocale:[NSLocale systemLocale]];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}

@end
