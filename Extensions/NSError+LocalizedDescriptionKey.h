//
//  NSError+LocalizedDescriptionKey.h
//  ipPort
//
//  Created by Dmitriy Zadoroghniy on 07.08.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (LocalizedDescriptionKey)

+ (id)errorWithDomain:(NSString *)domain code:(NSInteger)code localizedDescription:(NSString *)localizedDescription;

@end
