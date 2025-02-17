// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation
import Testing
@testable import GameFissionSimulatorCore

/// Unit tests of "Mass" struct.
@Suite("RandomNumberGeneratorWithSeed unit test")
struct RandomNumberGeneratorWithSeedUnitTest {

    /// The service to test.
    private let service: FixedRandomNumberGenerator = FixedRandomNumberGenerator()

    @Test("The first next should be this")
    func firstNextShouldBeThis() throws {

        // Arrange.
        let expected: UInt64 = 4634132415377626121

        // Act.
        let actual: UInt64 = service.next()

        // Assert.
        #expect(actual == expected)
    }

    @Test("Lot of nexts should be this", arguments: zip(
    [0,
     10,
     100,
     1_000],
    [4634132415377626121,
     11147349224792255867,
     16255432253904366547,
     11349708381520460738]))
    func lotOfNextsShouldBeThis(numberOfNexts: Int, expected: UInt64) throws {

        // Arrange
        for _ in 0..<numberOfNexts {
            _ = service.next()
        }

        // Act.
        let actual: UInt64 = service.next()

        // Assert.
        #expect(actual == expected)
    }
}
