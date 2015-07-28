//
//  NSString+HA1.h
//  ipPort
//
//  Created by Dmitriy Zadoroghnyy on 27/07/15.
//  Copyright (c) 2015 ipPort. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HA1)

/**
 *  Вычисление HA1
 *
 *  @param login    логин
 *  @param password пароль
 *  @param realm    realm
 *
 *  @return HA1
 */
+ (NSString *)ha1WithLogin:(NSString *)login password:(NSString *)password realm:(NSString *)realm;

@end
