//
//  NSString+Phone.h
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 16.12.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Phone)

/**
 *  Создание номера телефона для звонка.
 *
 *  @param number номер телефона
 *  @param code   код страны
 *
 *  @return номер телефона для звонка
 */
+ (NSString *)createPhoneNumber:(NSString *)number countyCode:(NSString *)code;

/**
 *  Удаление плюса.
 *
 *  @return Возвращается строчка без плюса.
 */
- (NSString *)  removePlus;

/**
 *  Преобразование строки с номером телефона к строке с номером телефона пригодной для звонка.
 *
 *  @return Строка с номером телефона для звонка.
 */
- (NSString *)  formatCall;

/**
 *  Сравнение телефонных номеров.
 *
 *  @param phoneNumber телефонный номер для сравнения
 *
 *  @return YES, если номера совпадают, в противном случае - NO
 */
- (BOOL)        isEqualPhoneNumber:(NSString *)phoneNumber;
- (NSString *)  getPhoneString;
- (NSString *)  getString10;
- (BOOL)        isAddressBookPhoneComparedWith:(NSString *)phone;

/**
 *  Проверка кода подтвержения для СМС на валидность.
 *
 *  @param code код подтверждения
 *
 *  @return YES - если код соответствует требованиям, в противном случае - NO.
 */
+ (BOOL)isCodeValid:(NSString *)code;

/**
 *  Проверка кода подтвержения для СМС на валидность.
 *
 *  @return YES - если код соответствует требованиям, в противном случае - NO.
 */
- (BOOL)isCodeValid;

/**
 *  Проверка телефонного номера на валидность.
 *
 *  @param phone телефонный номер для проверки
 *
 *  @return YES - если телефонный номер соответствует требованиям, в противном случае - NO.
 */
+ (BOOL)isPhoneValid:(NSString *)phone;

/**
 *  Проверка телефонного номера на валидность.
 *
 @remarks перед проверкой вызывается метод `formatCall`.
 @see formatCall
 
 *  @return YES - если телефонный номер соответствует требованиям, в противном случае - NO.
 */
- (BOOL)isPhoneValid;

@end
