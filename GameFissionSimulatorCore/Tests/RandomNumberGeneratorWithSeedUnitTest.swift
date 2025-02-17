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
@Suite("RandomNumberGeneratorWithSeed unit test", .serialized)
struct RandomNumberGeneratorWithSeedUnitTest {

    /// The service to test.
    private let service: RandomNumberGeneratorWithSeed

    /// Initialize the struct (called each time before a test function is called).
    init() throws {
        let seed: Int = 0123456789
        service = RandomNumberGeneratorWithSeed(seed)
    }

    @Test("The first next should be this")
    func firstNextShouldBeThis() throws {

        // Arrange.
        let expected: UInt64 = 967872380456206336

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
    [967872380456206336,
     4494986641987534848,
     12717718239014354944,
     934510648099405824]))
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
