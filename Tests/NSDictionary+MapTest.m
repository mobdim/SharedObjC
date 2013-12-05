//
//  Broadcast - NSDictionary+MapTest.m
//  Copyright 2013 Dmitriy Zadoroghnyy. All rights reserved.
//
//  Created by: Dmitriy Zadoroghnyy on 04.12.13.
//

    // Class under test
#import "NSDictionary+Map.h"

    // Collaborators

    // Test support
#import <XCTest/XCTest.h>

// Uncomment the next two lines to use OCHamcrest for test assertions:
//#define HC_SHORTHAND
//#import <OCHamcrestIOS/OCHamcrestIOS.h>

// Uncomment the next two lines to use OCMockito for mock objects:
//#define MOCKITO_SHORTHAND
//#import <OCMockitoIOS/OCMockitoIOS.h>

/*
 
 ЗАДАЧИ ТЕСТИРОВАНИЯ:
	- <#Test tasks#>
 
 */

@interface MapTest : NSObject

@property (copy, nonatomic) NSNumber *m_num;
@property (copy, nonatomic) NSString *m_text;
@property (copy, nonatomic) NSDate *m_date;

@end

@implementation MapTest


@end

@interface NSDictionary_MapTest : XCTestCase
@end

@implementation NSDictionary_MapTest
{
    // test fixture ivars go here
}

- (void) testMap {
    NSDictionary *dict = @{@"m_num" : @1,
                           @"m_text" : @"test",
                           @"m_date" : [NSDate date],
                           @"m_ignoring": @"ignore this text"};
    
    MapTest *maptest = [MapTest new];
    [dict mapTo:maptest];
    
    NSDictionary *dict2 = @{@"num" : @1,
                           @"text" : @"test",
                           @"date" : [NSDate date],
                           @"ignoring": @"ignore this text"};
    
    MapTest *maptest2 = [MapTest new];
    [dict2 mapTo:maptest2 withPrefix:@"m_"];
    
    NSLog(@"");
}
@end
