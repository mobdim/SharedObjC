//
//  NSObject+Thread.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 14.04.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import "NSObject+Thread.h"

@implementation NSObject (Thread)

+ (void) dispatch_sync_on_main_thread:(dispatch_block_t) block {
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

+ (void) dispatch_async_on_main_thread:(dispatch_block_t) block {
    dispatch_async(dispatch_get_main_queue(), block);
}


@end
