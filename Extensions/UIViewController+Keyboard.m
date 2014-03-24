//
//  UIViewController+Keyboard.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 21.03.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import "UIViewController+Keyboard.h"
#import "NSObject+AssociatedObject.h"

static NSString *keyKeyboardShown = @"com.mobdim.keyboardShown";
static NSString *keyKeyboardRect   = @"com.mobdim.keyboardRect";

@implementation UIViewController (Keyboard)

- (void) keyboardRegisterNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector (keyboardWillShow:)
                                                 name: UIKeyboardWillShowNotification object: nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector (keyboardDidShow:)
                                                 name: UIKeyboardDidShowNotification object: nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector (keyboardWillHide:)
                                                 name: UIKeyboardWillHideNotification object: nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector (keyboardDidHide:)
                                                 name: UIKeyboardDidHideNotification object: nil];

}

- (void) keyboardUnregisterNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

#pragma mark - Keyboard notifications

- (void) keyboardWillShow: (NSNotification *)notif {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if ([self respondsToSelector:@selector(willKeyboardShow)]) {
        [self performSelector:@selector(willKeyboardShow)];
    }
#pragma clang diagnostic pop
}

-(void) keyboardDidShow: (NSNotification *)notif
{
    [self setAssociatedObjectBoolCopy:YES forKey:keyKeyboardShown];
    
    NSValue *value = [[notif userInfo] objectForKey: UIKeyboardFrameEndUserInfoKey];
    
    [self setAssociatedObjectCGRectCopy:[value CGRectValue] forKey:keyKeyboardRect];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if ([self respondsToSelector:@selector(didKeyboardShow)]) {
        [self performSelector:@selector(didKeyboardShow)];
    }
#pragma clang diagnostic pop
}

-(void) keyboardWillHide: (NSNotification *)notif
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if ([self respondsToSelector:@selector(willKeyboardHide)]) {
        [self performSelector:@selector(willKeyboardHide)];
    }
#pragma clang diagnostic pop
}

-(void) keyboardDidHide: (NSNotification *)notif
{
    [self setAssociatedObjectBoolCopy:NO forKey:keyKeyboardShown];
    [self setAssociatedObjectCGRectCopy:CGRectZero forKey:keyKeyboardRect];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if ([self respondsToSelector:@selector(didKeyboardHide)]) {
        [self performSelector:@selector(didKeyboardHide)];
    }
#pragma clang diagnostic pop

}

- (BOOL) isKeyboardShown {
    return [self associatedOjectBoolForKey:keyKeyboardShown];
}

- (CGRect) keyboardRect {
    return [self associatedOjectCGRectForKey:keyKeyboardRect];
}

@end
