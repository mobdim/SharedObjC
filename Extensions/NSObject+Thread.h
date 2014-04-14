//
//  NSObject+Thread.h
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 14.04.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Thread)

+ (void) dispatch_sync_on_main_thread:(dispatch_block_t) block;
+ (void) dispatch_async_on_main_thread:(dispatch_block_t) block;

@end
