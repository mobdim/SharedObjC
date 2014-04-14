//
//  UIButton+UserInfo.m
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 14.04.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import "UIButton+UserInfo.h"
#import "NSObject+AssociatedObject.h"

NSString * const kButtonUserInfo = @"com.mobdim.button.userinfo";

@implementation UIButton (UserInfo)

- (void) setUserInfo:(NSDictionary *)userInfo {
    [self setAssociatedObjectCopy:userInfo forKey:kButtonUserInfo];
}

- (NSDictionary *) userInfo {
    return [self associatedObjectForKey:kButtonUserInfo];
}

@end
