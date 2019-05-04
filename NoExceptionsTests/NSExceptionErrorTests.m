//
//  NSExceptionErrorTests.m
//  NoExceptionsTests
//
//  Created by Joe Susnick on 5/4/19.
//  Copyright © 2019 Joe Susnick. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSExceptionError.h"

@interface NSExceptionErrorTests : XCTestCase

@end

@implementation NSExceptionErrorTests

- (void)testNoExceptionsErrorDomain {
    XCTAssertEqual(NoExceptionsErrorDomain, @"NoExceptionsErrorDomain",
                   @"There should be a public symbol for the error domain");
}

- (void)testCreatingWithException {
    NSDictionary *userInfo = @{ @"exception-user-info-key": @"exception-user-info-value" };
    NSString *name = @"exception-name";
    NSString *reason = @"exception-reason";

    NSException *exception = [NSException exceptionWithName:name
                                                     reason:reason
                                                   userInfo:userInfo];

    NSExceptionError *error = [[NSExceptionError alloc] initWithException:exception];

    XCTAssertEqual(error.domain, NoExceptionsErrorDomain,
                   @"An exception wrapping error should have a domain associated with it");
    XCTAssertEqual(error.code, 0,
                   @"An exception wrapping error should have a code of zero");
    XCTAssertEqual(error.userInfo, userInfo,
                   @"The exception's user info dictionary should be accessible through the error's dictionary");

    XCTAssertEqual(error.exception, exception,
                   @"The original exception should be included as a property of the error");
}

@end
