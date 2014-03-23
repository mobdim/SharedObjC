//
//  UIViewController+Keyboard.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 21.03.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import "UIViewController+Keyboard.h"
#import "NSObject+AssociatedObject.h"

static NSString *keyKeyboardShowed = @"com.mobdim.keyboardShowed";

@implementation UIViewController (Keyboard)

- (void) keyboardRegisterNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector (keyboardDidShow:)
                                                 name: UIKeyboardDidShowNotification object: nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector (keyboardWillHide:)
                                                 name: UIKeyboardWillHideNotification object: nil];
}

- (void) keyboardUnregisterNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - Keyboard notifications

-(void) keyboardDidShow: (NSNotification *)notif
{
    [self setAssociatedObject:[NSNumber numberWithBool:YES] forKey:keyKeyboardShowed];
    
    NSValue *value = [[notif userInfo] objectForKey: UIKeyboardFrameEndUserInfoKey];
    _keyboardRect = [value CGRectValue];
    
    UIView *v = [self.view.superview viewWithTag:tagSearchResultView];
    if (v) {
        SearchResultView *sv = (SearchResultView *)v;
        sv.height = _keyboardRect.origin.y
        - _tableView.y
        - [UIApplication sharedApplication].statusBarFrame.size.height;
    }
}

-(void) keyboardWillHide: (NSNotification *)notif
{
    _keyboardShowed = NO;
    
    _keyboardRect = CGRectZero;
}






@end
