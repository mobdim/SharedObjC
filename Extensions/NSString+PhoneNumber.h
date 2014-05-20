//
//  NSString+PhoneNumber.h
//  epiphone
//
//  Created by Dmitriy Zadoroghniy on 20.05.14.
//  Copyright (c) 2014 Dmitriy Zadoroghnyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PhoneNumber)

- (NSString *)  removePlus;
- (NSString *)  formatCall;
- (BOOL)        isEqualPhoneNumber:(NSString *)phoneNumber;
- (NSString *)  getPhoneString;
- (NSString *)  getString10;
- (BOOL)        isAddressBookPhoneComparedWith:(NSString *)phone;


@end
