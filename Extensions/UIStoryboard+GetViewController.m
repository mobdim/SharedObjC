//
//  UIStoryboard+GetViewController.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 07.11.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#import "UIStoryboard+GetViewController.h"
#import "NSString+FirstLetter.h"

//#import "StoryboardIdents.h"
/***
 NSString *StoryboardIdents[] = {
    @"ViewController",
 };
***/

@implementation UIStoryboard (GetViewController)

//- (id) getViewControllerBy:(StoryboardViewControllerIds)vcId {
//    NSString *svc = StoryboardIdents[vcId];
//    
//    id vc = [self instantiateViewControllerWithIdentifier:[svc stringWithLowerFirstLetter]];
//    
//    return vc;
//}

- (id) getViewControllerByClass:(Class)cl {
    NSString *svc = NSStringFromClass(cl);
    
    id vc = [self instantiateViewControllerWithIdentifier:[svc stringWithLowerFirstLetter]];
    
    return vc;
}

@end
