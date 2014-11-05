//
//  UIViewController+ModalCheck.m
//  ipPort
//
//  Created by Dmitriy Zadoroghniy on 05.11.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import "UIViewController+ModalCheck.h"

@implementation UIViewController (ModalCheck)

- (BOOL)isModal {
    return self.presentingViewController.presentedViewController == self
    || (self.navigationController && (self.navigationController.presentingViewController.presentedViewController == self.navigationController))
    || [self.tabBarController.presentingViewController isKindOfClass:[UITabBarController class]];
}

@end
