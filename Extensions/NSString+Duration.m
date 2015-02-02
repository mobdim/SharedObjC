//
//  NSString+Duration.m
//  ipPort
//
//  Created by Dmitriy Zadoroghniy on 02.02.15.
//  Copyright (c) 2015 ipPort. All rights reserved.
//

#import "NSString+Duration.h"

@implementation NSString (Duration)

+ (NSString *)textDuration:(NSTimeInterval)duration {
    
    div_t h = div(duration, 3600);
    int hours = h.quot;
    div_t m = div(h.rem, 60);
    int minutes = m.quot;
    int seconds = m.rem;
    
    NSString *result = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    
    if (hours) {
        result = [[NSString stringWithFormat:@"%02d", hours] stringByAppendingString:result];
    }
    
    return result;
}


@end
