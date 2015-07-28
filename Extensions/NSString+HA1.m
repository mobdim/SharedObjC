//
//  NSString+HA1.m
//  ipPort
//
//  Created by Dmitriy Zadoroghnyy on 27/07/15.
//  Copyright (c) 2015 ipPort. All rights reserved.
//

#import "NSString+HA1.h"
#import "NSString+md5.h"

@implementation NSString (HA1)

+ (NSString *)ha1WithLogin:(NSString *)login password:(NSString *)password realm:(NSString *)realm {
    
    NSString *hash = [NSString stringWithFormat:@"%@:%@:%@", login, realm, password];
    
    return [NSString md5:hash];
}

@end
