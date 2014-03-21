//
//  NSObject+AssociatedObject.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 21.03.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import "NSObject+AssociatedObject.h"
#import <objc/objc-runtime.h>

@implementation NSObject (AssociatedObject)

#pragma mark - CGRect

- (void) setAssociatedObjectCGRectCopy:(CGRect)object forKey:(NSString *)key {
    NSValue *v = [NSValue valueWithCGRect:object];
    [self setAssociatedObjectCopy:v forKey:key];
}

- (CGRect) associatedOjectCGRectForKey:(NSString *)key {
    return [[self associatedObjectForKey:key] CGRectValue];
}

#pragma mark - BOOL

- (void) setAssociatedObjectBoolCopy:(BOOL)object forKey:(NSString *)key {
    [self setAssociatedObjectCopy:[NSNumber numberWithBool:object] forKey:key];
}

- (void) setAssociatedObjectBoolRetain:(BOOL)object forKey:(NSString *)key {
    [self setAssociatedObjectRetain:[NSNumber numberWithBool:object] forKey:key];
}

- (BOOL) associatedOjectBoolForKey:(NSString *)key {
    return [[self associatedObjectForKey:key] boolValue];
}

#pragma mark - Base

- (void) setAssociatedObjectCopy:(id)object forKey:(NSString *)key {
    objc_setAssociatedObject(self, (__bridge const void *)key, object, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void) setAssociatedObjectRetain:(id)object forKey:(NSString *)key {
    objc_setAssociatedObject(self, (__bridge const void *)key, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id) associatedObjectForKey:(NSString *)key {
    return objc_getAssociatedObject(self, (__bridge const void *)key);
}

@end
