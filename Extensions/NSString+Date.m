//
//  NSString+Date.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 14.01.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)

- (NSDate *)dateFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    [formatter setLocale:[NSLocale systemLocale]];
	[formatter setDateFormat:format];
	return [formatter dateFromString:self];
}

@end
