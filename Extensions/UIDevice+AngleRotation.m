//
//  UIDevice+AngleRotation.m
//  vvp
//
//  Created by Dmitriy Zadoroghnyy on 02.03.14.
//  Copyright (c) 2014 Dmitriy Zadoroghnyy. All rights reserved.
//

#import "UIDevice+AngleRotation.h"

@implementation UIDevice (AngleRotation)

+ (CGFloat) angleByRotation {
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    CGFloat angle = 0.0;
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            angle = 0.0;
            break;
        case UIDeviceOrientationLandscapeLeft:
            angle = M_PI/2;
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            angle = M_PI;
            break;
        case UIDeviceOrientationLandscapeRight:
            angle = -M_PI/2;
            break;
        default:
            break;
    }
    
    return angle;
}

@end
