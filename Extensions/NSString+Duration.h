//
//  NSString+Duration.h
//  ipPort
//
//  Created by Dmitriy Zadoroghniy on 02.02.15.
//  Copyright (c) 2015 ipPort. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Duration)

/**
 *  Вывод продолжительности.
 *
 *  @param duration продолжительность в секундах.
 *
 *  @return [hh:]mm:ss
 */
+ (NSString *)textDuration:(NSTimeInterval)duration;

@end
