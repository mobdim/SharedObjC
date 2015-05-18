//
//  UIStoryboard+GetViewController.h
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 07.11.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "StoryboardViewControllerIds.h"
/***
 typedef NS_ENUM(NSInteger, StoryboardViewControllerIds) {
    sbViewController = 0,
 };
***/

extern NSString *StoryboardIdents[];

@interface UIStoryboard (GetViewController)

//- (id) getViewControllerBy:(StoryboardViewControllerIds)vcId;
- (id)getViewControllerByClass:(Class)cl;
- (id)viewControllerSwiftByClass:(Class)cl;

@end
