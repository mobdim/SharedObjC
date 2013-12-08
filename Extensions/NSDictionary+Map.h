//
//  NSDictionary+Map.h
//  Broadcast
//
//  Created by Dmitriy Zadoroghnyy on 04.12.13.
//  Copyright (c) 2013 Dmitriy Zadoroghnyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSDictionary (Map)

- (void) mapTo:(id)objMap;
- (void) mapTo:(id)objMap withPrefix:(NSString *)prefix;

@end
