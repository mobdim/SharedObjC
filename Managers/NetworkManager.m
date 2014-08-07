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

@end

@implementation NetworkManager

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    
    @weakify(self);
    [[AFHTTPRequestOperationManager manager].networkReachabilityStatusSignal subscribeNext:^(NSNumber *status) {
        @strongify(self);
        AFNetworkReachabilityStatus networkStatus = [status intValue];
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
                DDLogWarn(@"== ReachabilityStatusNotReachable");
                break;
            case ReachabilityStatusReachableViaWWAN:
                DDLogWarn(@"== ReachabilityStatusReachableViaWWAN");
                break;
            case ReachabilityStatusReachableViaWiFi:
                DDLogWarn(@"== ReachabilityStatusReachableViaWiFi");
                break;
                
            default:
                break;
        }
    }];
#endif
    
    return self;
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
