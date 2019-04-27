//
//  NonThrowingTests.m
//  NoExceptionsTests
//
//  Created by CatPalace on 4/13/19.
//  Copyright © 2019 CatPalace. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NoExceptionsTests-Swift.h"
#import "NSExceptionError.h"

@interface NonThrowingTests : XCTestCase

@property SwiftInvocationHelper *helper;

@end

@implementation NonThrowingTests

- (void)setUp {
    [super setUp];

    self.helper = [SwiftInvocationHelper new];
}

- (void)testOptionallyTrappingNonThrowingMethod {
    @try {
        [self.helper invokeTrappingOptionally];
        XCTAssertTrue(self.helper.methodWasInvoked, @"The method should have completed");
    }
    @catch(NSException *exception) {
        XCTFail(@"A non-exception-throwing method should be optionally invocable");
    }
}

- (void)testTrappingNonThrowingMethod {
    NSError *error;
    @try {
        [self.helper invokeTrappingAndReturnError:&error];
        XCTAssertTrue(self.helper.methodWasInvoked, @"The method should have completed");
        XCTAssertNil(error, @"No error should have been caught");
    }
    @catch(NSException *exception) {
        XCTFail(@"A non-exception-throwing method should be invocable as a throwing method");
    }
}

- (void)testOptionallyTrappingNonThrowingCurrentScopeAssignment {
    @try {
        id output = [self.helper assignTrappingOptionally];
        XCTAssertNotNil(output, @"The method should have completed and returned its output");
    }
    @catch(NSException *exception) {
        XCTFail(@"A non-exception-throwing method should be optionally invocable");
    }
}

- (void)testTrappingNonThrowingCurrentScopeAssignment {
    @try {
        NSError *error;
        id output = [self.helper assignTrappingAndReturnError:&error];
        XCTAssertNotNil(output, @"The method should have completed and returned its output");
        XCTAssertNil(error, @"No error should have been caught");
    }
    @catch(NSException *exception) {
        XCTFail(@"A non-exception-throwing method should be invocable as a throwing method");
    }
}

@end
