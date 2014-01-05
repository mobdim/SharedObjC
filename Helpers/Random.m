//
//  Random.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 17.12.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#import "Random.h"

@implementation Random

+ (int)number:(int)from to:(int)to {
    return (int)from + arc4random() % (to - from + 1);
}

+ (int)from:(int)lo to:(int)hi {
    return arc4random_uniform(hi - lo + 1) + lo;
}


@end
