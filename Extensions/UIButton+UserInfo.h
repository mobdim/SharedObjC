//
//  UIButton+UserInfo.h
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 14.04.14.
//  Copyright (c) 2014 ipPort. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const kButtonUserInfo;

@interface UIButton (UserInfo)

- (void) setUserInfo:(NSDictionary *)userInfo;
- (NSDictionary *) userInfo;

@end
