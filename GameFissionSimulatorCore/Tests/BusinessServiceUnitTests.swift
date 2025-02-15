// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation
import XCTest
@testable import GameFissionSimulatorCore

/// Unit tests of "LotteryCore" class.
final class BusinessServiceUnitTests: XCTestCase {

    /// Test an initialization with the default no arg constructor.
    func testNoArgConstructor() throws {

        // Arrange (nothing to do, really).

        // Act.
        let service: BusinessService = BusinessService()

        // Assert.
        XCTAssertNotNil(service)
    }

    /// Test an initialization with the full constructor
    func testFullConstructor() throws {

        // Arrange.
        let rng: RandomNumberGenerator = SystemRandomNumberGenerator()

        // Act.
        let service: BusinessService = BusinessService(rng)

        // Assert.
        XCTAssertNotNil(service)
    }

    /// Test the description member.
    func testDescription() throws {

        // Arrange.
        let service: BusinessService = BusinessService()
        let expected: String = "BusinessService()"

        // Act.
        let actual: String = service.description

        // Assert.
        XCTAssertEqual(actual, expected)
    }
}
