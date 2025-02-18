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
@Suite("BusinessService unit test")
struct BusinessServiceUnitTests {

    /// The service to test.
    private let service: BusinessService

    /// Initialize the struct (called each time before a test function is called).
    init() throws {

        // A not so random number generator.
        let rng: RandomNumberGenerator = FixedRandomNumberGenerator()

        // Instantiate the service with the custom rng.
        service = BusinessService(rng)
    }

    @Test("No arg constructor do nothing wrong")
    func noArgConstructor() throws {

        // Arrange and Act.
        let service: BusinessService = BusinessService()

        // Assert.
        #expect(service != nil)
    }

    @Test("Full constructor do nothing wrong")
    func fullConstructor() throws {

        // Service instance is already created.
        // Nothing to do.

        // Assert.
        #expect(service != nil)
    }

    @Test("Description is this")
    func description() throws {

        // Arrange.
        let expected: String = "BusinessService()"

        // Act.
        let actual: String = service.description

        // Assert.
        #expect(actual == expected)
    }

    @Test("Fissible count")
    func fissibleCount() async throws {

        // Arrange.
        let expected: Int = 1

        // Act.
        let actual: Int = service.fissibleCount

        // Assert.
        #expect(actual == expected)
    }

    @Test("Tick function", arguments: [
        0,
        1,
        100,
        1_000])
    func tick(count: Int) async throws {

        // Arrange
        let expected: Int = count
        for _ in 0..<count {
            service.tick()
        }

        // Act
        let actual: Int = service.tickCount

        // Assert.
        #expect(actual == expected)
    }
}
