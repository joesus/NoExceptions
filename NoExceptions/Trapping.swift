//
//  Trapping.swift
//  NoExceptions
//
//  Created by CatPalace on 4/13/19.
//  Copyright © 2019 CatPalace. All rights reserved.
//

import Foundation

/// A top-level function that provides the ability for Swift code to catch an `NSException`
///
/// - Parameter trappable: A closure that may throw that executes code that may cause an Objective-C exception
///
/// - Throws: Errors wrapping exceptions or those thrown by the input closure
/// - Returns: Generic output for the input closure. May be `Void`

public func trapping<Output>(
    trappable: @escaping () throws -> Output
    ) throws -> Output {

    var potentialError: Error?
    var potentialOutput: Output?

    /// Allows to pass throwing and non-throwing closures into Objective-C
    /// without Objective-C having to handle thrown errors
    let invoke: () -> Void = {
        do {
            try potentialOutput = trappable()
        }
        catch {
            potentialError = error
        }
    }

    /// Execute in Objective-C scope and throw any exception errors
    try ExceptionTrapper().catchException(in: invoke)

    if let error = potentialError {
        throw error
    }
    else if let output = potentialOutput {
        return output
    }
    else {
        fatalError("Should have a result or an error by now")
    }
}
