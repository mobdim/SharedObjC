//
//  UIColor+Equal.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 08.11.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#import "UIColor+Equal.h"

@implementation UIColor (Equal)


@end

BOOL colorSimilarToColor(UIColor *left, UIColor *right) {
	float tolerance = 0.05; // 5%
	
	CGColorRef leftColor = [left CGColor];
	CGColorRef rightColor = [right CGColor];
	
	if (CGColorGetColorSpace(leftColor) != CGColorGetColorSpace(rightColor)) {
		return FALSE;
	}
	
	int componentCount = CGColorGetNumberOfComponents(leftColor);
	
	const float *leftComponents = CGColorGetComponents(leftColor);
	const float *rightComponents = CGColorGetComponents(rightColor);
	
	for (int i = 0; i < componentCount; i++) {
		float difference = leftComponents[i] / rightComponents[i];
		
		if (fabs(difference - 1) > tolerance) {
			return FALSE;
		}
	}
	
	return TRUE;
}
