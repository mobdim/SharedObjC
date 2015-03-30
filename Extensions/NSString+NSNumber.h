//
//  NSString+NSNumber.h
//  ipPort
//
//  Created by Dmitriy Zadoroghniy on 12.01.15.
//  Copyright (c) 2015 ipPort. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSNumber)

/**
 *  Преобразование NSString -> NSNumber.
 *
 *  @return NSNumber
 */
- (NSNumber *)number;

- (NSNumber *)floatNumber;

@end
