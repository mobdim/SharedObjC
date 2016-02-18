//
//  NSString+NilOrEmpty.h
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 04.12.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NilOrEmpty)

+ (BOOL) isNil:(nullable NSString *)string;
+ (BOOL) isEmpty:(nonnull NSString *)string;
+ (BOOL) isNilOrEmpty:(nullable NSString *)string;

- (BOOL)isEmpty;

@end
