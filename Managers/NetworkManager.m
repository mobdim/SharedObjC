//
//  NetworkManager.m
//  ipPort
//
//  Created by Dmitriy Zadoroghniy on 07.08.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import "NetworkManager.h"
#import <AFNetworking-RACExtensions/RACAFNetworking.h>

@interface NetworkManager ()

@property (assign, nonatomic) ReachabilityStatus networkStatus;
@property (strong, nonatomic) AFNetworkReachabilityManager *reachabilityManager;

@end

@implementation NetworkManager

- (void)dealloc {
    [self.reachabilityManager stopMonitoring];
}

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    
    self.reachabilityManager = [AFNetworkReachabilityManager managerForDomain:[self class].domainForReachability];
    
    [self.reachabilityManager startMonitoring];
    
    @weakify(self)
    [self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus networkStatus) {
        @strongify(self);
        switch (networkStatus) {
            case AFNetworkReachabilityStatusUnknown:
                self.networkStatus = ReachabilityStatusUnknown;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                self.networkStatus = ReachabilityStatusNotReachable;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                self.networkStatus = ReachabilityStatusReachableViaWWAN;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                self.networkStatus = ReachabilityStatusReachableViaWiFi;
                break;
        };
    }];
    
#ifdef DEBUG
    [RACObserve(self, networkStatus) subscribeNext:^(NSNumber *value) {
        switch (value.integerValue) {
            case ReachabilityStatusUnknown:
                DDLogWarn(@"== ReachabilityStatusUnknown");
                break;
            case ReachabilityStatusNotReachable:
                DDLogInfo(@"== ReachabilityStatusNotReachable");
                break;
            case ReachabilityStatusReachableViaWWAN:
                DDLogInfo(@"== ReachabilityStatusReachableViaWWAN");
                break;
            case ReachabilityStatusReachableViaWiFi:
                DDLogInfo(@"== ReachabilityStatusReachableViaWiFi");
                break;
                
            default:
                break;
        }
    }];
#endif
    
    return self;
}

+ (NSString *)domainForReachability {
    DDLogError(@"Пустой адрес для проверки статуса сети!!!");
    return nil;
}

+ (NSString *)webServiceAddress {
    DDLogError(@"Пустой адрес вебсервиса!!!");
    return nil;
}

+ (NSURL *)urlWithServerAddress:(NSString *)s {
    NSString *prefix = s.length > 0 ? @"?" : @"";
    NSString *checkSeparator = [s substringWithRange:NSMakeRange(0, 1)];
    if ([checkSeparator isEqualToString:@"/"]) {
        prefix = @"";
    }
    NSString *string = [NSString stringWithFormat:@"%@%@%@", self.webServiceAddress, prefix, s];
    return [NSURL URLWithString:[string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}

+ (NSString *)stringWithServerAddress:(NSString *)s {
    NSString *prefix = s.length > 0 ? @"?" : @"";
    NSString *checkSeparator = [s substringWithRange:NSMakeRange(0, 1)];
    if ([checkSeparator isEqualToString:@"/"]) {
        prefix = @"";
    }
    NSString *string = [NSString stringWithFormat:@"%@%@%@", self.webServiceAddress, prefix, s];
    return [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (BOOL)isReachable {
    return self.networkStatus == ReachabilityStatusReachableViaWWAN || self.networkStatus == ReachabilityStatusReachableViaWiFi;
}

@end
