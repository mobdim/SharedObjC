//
//  NSString+Phone.h
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 16.12.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Phone)

- (NSString *)  removePlus;
- (NSString *)  formatCall;
- (BOOL)        isEqualPhoneNumber:(NSString *)phoneNumber;
- (NSString *)  getPhoneString;
- (NSString *)  getString10;
- (BOOL)        isAddressBookPhoneComparedWith:(NSString *)phone;

@end
