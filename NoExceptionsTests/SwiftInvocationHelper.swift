//
//  SwiftInvocationHelper.swift
//  NoExceptionsTests
//
//  Created by CatPalace on 4/13/19.
//  Copyright © 2019 CatPalace. All rights reserved.
//

import NoExceptions

@objc class SwiftInvocationHelper: NSObject {

    let nonThrower = NonThrowingClass()

    @objc var methodWasInvoked: Bool {
        return nonThrower.methodWasInvoked
    }

    @objc func invokeTrappingOptionally() {
        try? trapping { self.nonThrower.nonThrowingMethod() }
    }

    @objc func invokeTrapping() throws {
        try trapping { self.nonThrower.nonThrowingMethod() }
    }

    @objc func assignTrappingOptionally() -> Any? {
        return try? trapping(trappable: nonThrower.nonThrowingGetter)
    }

    @objc func assignTrapping() throws -> Any {
        return try trapping(trappable: nonThrower.nonThrowingGetter)
    }

}
