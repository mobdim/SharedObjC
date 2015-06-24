//
//  NSString+RemoveCharacters.h
//  ipPort
//
//  Created by Dmitriy Zadoroghnyy on 24/06/15.
//  Copyright (c) 2015 ipPort. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RemoveCharacters)

/**
 *  Удаление всех пробелов из строки.
 *
 *  @return Результирующая строка после удаления всех пробелов.
 */
- (NSString *)removeAllWhitespaces;

@end
