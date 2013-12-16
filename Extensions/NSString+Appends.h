//
//  NSString+Appends.h
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 16.12.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Appends)

- (NSString *) appendIfNotNilAndEmpty:(NSString *)value;
- (NSString *) appendIfNotNil:(NSString *)value;

@end
