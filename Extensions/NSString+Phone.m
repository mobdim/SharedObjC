//
//  NSString+Phone.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 16.12.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#import "NSString+Phone.h"

@implementation NSString (Phone)

- (NSString *) removePlus {
    return [self stringByReplacingOccurrencesOfString:@"+" withString:@""];
}

- (NSString *) formatCall {
    
    NSMutableString *number = [[NSMutableString alloc] initWithString:self];
    
    if (self.length > 2) {
        if ([self hasPrefix:@"8"]) {
            number = [[NSMutableString alloc] initWithFormat:@"+7%@", [self substringFromIndex:1]];
        }
        [number replaceOccurrencesOfString:@"-" withString:@"" options:0 range:NSMakeRange(0, [number length])];
        [number replaceOccurrencesOfString:@"(" withString:@"" options:0 range:NSMakeRange(0, [number length])];
        [number replaceOccurrencesOfString:@" " withString:@"" options:0 range:NSMakeRange(0, [number length])];
        [number replaceOccurrencesOfString:@")" withString:@"" options:0 range:NSMakeRange(0, [number length])];
    }
    
    return (NSString *)number;
}

- (BOOL) isEqualPhoneNumber:(NSString *)phoneNumber {
    NSString *t1 = [[self formatCall] removePlus];
    NSString *t2 = [[phoneNumber formatCall] removePlus];
    return [t1 isEqualToString:t2];
}

- (NSString *) getPhoneString {
    NSMutableString *strippedString = [NSMutableString
                                       stringWithCapacity:self.length];
    
    NSScanner *scanner = [NSScanner scannerWithString:self];
    NSCharacterSet *numbers = [NSCharacterSet
                               characterSetWithCharactersInString:@"0123456789"];
    
    while ([scanner isAtEnd] == NO) {
        NSString *buffer;
        if ([scanner scanCharactersFromSet:numbers intoString:&buffer]) {
            [strippedString appendString:buffer];
            
        } else {
            [scanner setScanLocation:([scanner scanLocation] + 1)];
        }
    }
    
    return strippedString;
}


- (NSString *) getString10 {
    NSString *s;
    if ([self length] < 10) {
        s = self;
    } else {
        s = [self substringWithRange:NSMakeRange([self length] - 10, 10)];
    }
    
    return s;
}

- (BOOL) isAddressBookPhoneComparedWith:(NSString *)phone {
    
    phone = [[phone getPhoneString] getString10];
    NSString *abPhone = [[self getPhoneString] getString10];
    
//    DDLogVerbose(@"compared: %@, %@, %d", abPhone, phone, [phone length]);
    
    return [abPhone isEqualToString:phone];
}

+ (BOOL)isPhoneValid:(NSString *)phone {
    if (!phone) return NO;
    
    NSString *phonePattern = @"\\+?[1-9]+[0-9]*";
    
    NSRange range = NSMakeRange(0, phone.length);
    
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:phonePattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult *match = [regex firstMatchInString:phone options:0 range:range];
    return (match != nil && NSEqualRanges(match.range, range));
}

- (BOOL)isPhoneValid {
    NSString *formattedPhone = [self formatCall];
    
    return [NSString isPhoneValid:formattedPhone];
}

@end
