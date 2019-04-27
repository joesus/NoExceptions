//
//  TrappingTests.swift
//  TrappingTests
//
//  Created by CatPalace on 4/13/19.
//  Copyright © 2019 CatPalace. All rights reserved.
//

import XCTest
import NoExceptions

class TrappingTests: XCTestCase {

    // MARK: - Throwing method invocations

    func testOptionallyTrappingMethod() {
        try? trapping { ThrowingClass().throwingMethod() }
    }

    func testTrappingMethod() {
        do {
            try trapping { ThrowingClass().throwingMethod() }
            XCTFail("The thrown exception should have been captured as an error")
        }
        catch {
            validateExceptionError(error)
        }
    }

    func testOptionallyTrappingCurrentScopeAssignment() {
        let output = try? trapping(trappable: ThrowingClass().throwingGetter)
        XCTAssertNil(output, "There should be output returned as an exception should have been thrown")
    }

    func testTrappingCurrentScopeAssignment() {
        do {
            _ = try trapping(trappable: ThrowingClass().throwingGetter)
            XCTFail("The thrown exception should have been captured as an error")
        }
        catch {
            validateExceptionError(error)
        }
    }

    private func validateExceptionError(
        _ error: Error,
        file: StaticString = #file,
        line: UInt = #line
        ) {

        let nsError = error as? NSExceptionError
        XCTAssertEqual(
            nsError?.exception.name.rawValue,
            "ThrowingClassException",
            "The trapped exception should be turned into an actual error",
            file: file,
            line: line
        )
    }

}
