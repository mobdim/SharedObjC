//
//  NSObject+AssociatedObject.h
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 21.03.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AssociatedObject)

- (void) setAssociatedObjectBoolCopy:(BOOL)object forKey:(NSString *)key;
- (void) setAssociatedObjectBoolRetain:(BOOL)object forKey:(NSString *)key;
- (BOOL) associatedOjectBoolForKey:(NSString *)key;

- (void) setAssociatedObjectCopy:(id)object forKey:(NSString *)key;
- (void) setAssociatedObjectRetain:(id)object forKey:(NSString *)key;
- (id) associatedObjectForKey:(NSString *)key;

@end
