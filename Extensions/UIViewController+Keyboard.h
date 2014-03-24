//
//  UIViewController+Keyboard.h
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 21.03.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Keyboard)

- (BOOL) isKeyboardShown;
- (CGRect) keyboardRect;

- (void) keyboardRegisterNotifications;
- (void) keyboardUnregisterNotifications;

@end
