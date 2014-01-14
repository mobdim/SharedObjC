//
//  NSString+Date.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghnyy on 14.01.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)

- (NSDate *) dateFormat:(NSString *)format {
    NSTimeZone *currentDateTimeZone = [NSTimeZone defaultTimeZone];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:currentDateTimeZone];
//	[formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_EN"]];
	[formatter setDateFormat:format];
    
    NSDate *result = [formatter dateFromString:self];

	return result;
}


@end
