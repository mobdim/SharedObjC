//
//  Common.h
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 07.11.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#ifndef ipPort_New_Common_h
#define ipPort_New_Common_h

#define GetDelegate(del)   AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate

#define CHECK(val) NSAssert((val), @#val)

#endif
