//
//  NSDictionary+Map.m
//  Broadcast
//
//  Created by Dmitriy Zadoroghnyy on 04.12.13.
//  Copyright (c) 2013 Dmitriy Zadoroghnyy. All rights reserved.
//

#import "NSDictionary+Map.h"

@implementation NSDictionary (Map)

- (id)unserializedRepresentationOfDatabaseValue:(id)databaseValue forPropertyNamed:(NSString *)propertyName
{
    objc_property_t property = class_getProperty(self.class, propertyName.UTF8String);
    if (property) {
        const char *attrs = property_getAttributes(property);
        if (attrs[0] == 'T' && attrs[1] == '@' && attrs[2] == '"') attrs = &(attrs[3]);
        
        if (databaseValue && strncmp(attrs, "NSURL", 5) == 0) {
            return [NSURL URLWithString:databaseValue];
        } else if (databaseValue && strncmp(attrs, "NSDate", 6) == 0) {
            return [NSDate dateWithTimeIntervalSince1970:[databaseValue integerValue]];
        } else if (databaseValue && strncmp(attrs, "NSDictionary", 12) == 0) {
            NSDictionary *dict = [NSPropertyListSerialization propertyListWithData:databaseValue options:kCFPropertyListImmutable format:NULL error:NULL];
            return dict && [dict isKindOfClass:NSDictionary.class] ? dict : @{};
        } else if (databaseValue && strncmp(attrs, "NSArray", 7) == 0) {
            NSArray *array = [NSPropertyListSerialization propertyListWithData:databaseValue options:kCFPropertyListImmutable format:NULL error:NULL];
            return array && [array isKindOfClass:NSArray.class] ? array : @[];
        }
    }
    
    return databaseValue;
}

- (BOOL)decodeFieldValue:(id)value intoPropertyName:(NSString *)propertyName toMap:(id)objMap withPrefix:(NSString *)prefix
{
    BOOL result = NO;
    
    if (value == [NSNull null]) value = nil;
    
    NSString *prefixPropertyName = propertyName;
    
    if (prefix) {
        prefixPropertyName = [prefix stringByAppendingString:propertyName];
    }
    
    if (NULL == class_getProperty([objMap class], prefixPropertyName.UTF8String)) {
        //DDLogVerbose(@"***[%@] ignoring property \"%@\", no matching!", NSStringFromClass([objMap class]), prefixPropertyName);
    } else {
        if (class_getProperty([objMap class], prefixPropertyName.UTF8String)) {
            [objMap setValue:[self unserializedRepresentationOfDatabaseValue:value forPropertyNamed:propertyName] forKeyPath:prefixPropertyName];
            result = YES;
        }
    }
    
    return result;
}

- (BOOL) mapTo:(id)objMap {
    return [self mapTo:objMap withPrefix:nil];
}

- (BOOL) mapTo:(id)objMap withPrefix:(NSString *)prefix {
    DDLogVerbose(@">>> Map from dictionary to class.");
    
    __block BOOL finded = NO;
    
    do {
        [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            finded = [self decodeFieldValue:obj intoPropertyName:key toMap:objMap withPrefix:prefix];
        }];
        if (finded) break;
        
        DDLogVerbose(@"...try lowercase...");
        [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            finded = [self decodeFieldValue:obj intoPropertyName:[key lowercaseString] toMap:objMap withPrefix:prefix];
        }];
        if (finded) break;
        
        DDLogVerbose(@"...try uppercase...");
        [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            finded = [self decodeFieldValue:obj intoPropertyName:[key uppercaseString] toMap:objMap withPrefix:prefix];
        }];
    } while (NO);
    
    DDLogVerbose(@"<<< Map from dictionary to class.");
    return finded;
}

@end
