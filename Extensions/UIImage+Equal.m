//
//  UIImage+Equal.m
//  Broadcast
//
//  Created by Dmitriy Zadoroghnyy on 08.11.13.
//  Copyright (c) 2013 Dmitriy Zadoroghnyy. All rights reserved.
//

#import "UIImage+Equal.h"

@implementation UIImage (Equal)

+ (BOOL)image:(UIImage *)image1 isEqualTo:(UIImage *)image2
{
    NSData *data1 = UIImagePNGRepresentation(image1);
    NSData *data2 = UIImagePNGRepresentation(image2);
    
    return [data1 isEqualToData:data2];
}

@end
