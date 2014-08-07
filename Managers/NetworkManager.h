//
//  NetworkManager.h
//  ipPort
//
//  Created by Dmitriy Zadoroghniy on 07.08.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ReachabilityStatus) {
    ReachabilityStatusUnknown = -1,
    ReachabilityStatusNotReachable,
    ReachabilityStatusReachableViaWWAN,
    ReachabilityStatusReachableViaWiFi
};

@interface NetworkManager : NSObject

@property (assign, nonatomic, readonly) ReachabilityStatus networkStatus;

+ (NSString *)webServiceAddress;
+ (NSURL *)urlWithServerAddress:(NSString *)s;
+ (NSString *)stringWithServerAddress:(NSString *)s;
- (BOOL)isReachable;

@end
