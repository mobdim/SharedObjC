//
//  NSString+FirstLetter.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 07.11.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#import "NSString+FirstLetter.h"

@implementation NSString (FirstLetter)

- (NSString *) stringWithLowerFirstLetter {
    /* create a locale where diacritic marks are not considered important, e.g. US English */
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en-US"];
    
    /* get first char */
    NSString *firstChar = [self substringToIndex:1];
    
    /* remove any diacritic mark */
    NSString *folded = [firstChar stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:locale];
    
    /* create the new string */
    NSString *result = [[folded lowercaseString] stringByAppendingString:[self substringFromIndex:1]];
    
    return result;
}

@end
