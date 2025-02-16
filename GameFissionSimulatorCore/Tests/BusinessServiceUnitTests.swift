// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation
import Testing
@testable import GameFissionSimulatorCore

/// Unit tests of "BusinessService" class.
struct BusinessServiceUnitTests {

    @Test("No arg constructor do nothing wrong")
    func noArgConstructor() throws {

        // Arrange (nothing to do, really).

        // Act.
        let service: BusinessService = BusinessService()

        // Assert.
        #expect(service != nil)
    }

    @Test("Full constructor do nothing wrong")
    func fullConstructor() throws {

        // Arrange.
        let rng: RandomNumberGenerator = SystemRandomNumberGenerator()

        // Act.
        let service: BusinessService = BusinessService(rng)

        // Assert.
        #expect(service != nil)
    }

    @Test("Description is this")
    func description() throws {

        // Arrange.
        let service: BusinessService = BusinessService()
        let expected: String = "BusinessService()"

        // Act.
        let actual: String = service.description

        // Assert.
        #expect(actual == expected)
    }
}
