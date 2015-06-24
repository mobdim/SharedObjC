//
//  NSString+RemoveCharacters.m
//  ipPort
//
//  Created by Dmitriy Zadoroghnyy on 24/06/15.
//  Copyright (c) 2015 ipPort. All rights reserved.
//

#import "NSString+RemoveCharacters.h"

@implementation NSString (RemoveCharacters)

- (NSString *)removeAllWhitespaces {
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

@end
