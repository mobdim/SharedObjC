//
//  NSError+LocalizedDescriptionKey.m
//  ipPort
//
//  Created by Dmitriy Zadoroghniy on 07.08.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import "NSError+LocalizedDescriptionKey.h"

@implementation NSError (LocalizedDescriptionKey)

+ (id)errorWithDomain:(NSString *)domain code:(NSInteger)code localizedDescription:(NSString *)localizedDescription {
    return [NSError errorWithDomain:domain code:code userInfo:@{NSLocalizedDescriptionKey: localizedDescription}];
}

@end
