// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation
import Testing
@testable import GameFissionSimulatorCore

/// Advanced Unit tests of ``BusinessService`` actor.
@Suite("BusinessService advanced unit test")
struct BusinessServiceAdvancedUnitTests {

    /// The service to test.
    private let service: BusinessService

    /// Initialize the struct (called each time before a test function is called).
    init() throws {

        // A not so random number generator.
        let rng: RandomNumberGenerator = FixedRandomNumberGenerator()

        // Instantiate the service with the custom rng.
        service = BusinessService(rng)
    }

    @Test("Create a new system, add a few neutrons and call ticks a few times, then count the energy", arguments: zip(
    [10,
     20],
    [try Energy(0.001),
     try Energy(0.001)]))
    func addNeutronAndCallTickAFewTimesThenCountEnergy(ticks: Int, expected: Energy) async throws {

        // Arrange.
        for _ in 1...ticks {
            await service.addNeutron()
            await service.tick()
        }

        // Act.
        let actual: Energy = await service.energy

        // Assert.
        #expect(actual == expected)
    }

    @Test("Create a new system, add 8 neutrons per ticks, repeat a given amout of times, then count the fissibles",
          arguments: zip(
        [10, 100, 200, 300, 400, 500, 1_000, 1_000_000],
        [00, 000, 000, 000, 000, 000, 0_000, 0_000_000]))
    func addEightNeutronParTickThenCallTickAGivenAmountOfTimesThenCountFissibles(
        ticks: Int, expected: Int) async throws {

        // Arrange.
        for _ in 1...ticks {
            try await service.addNeutron(8)
            await service.tick()
        }

        // Act.
        let actual: Int = await service.fissibleCount

        // Assert.
        #expect(actual == expected)
    }

    @Test("Create a new system, add 8 neutrons per ticks, repeat a given amout of times, then count the energy",
          arguments: zip(
        [10, 100, 200, 300, 400, 500, 1_000, 1_000_000],
        [0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001]))
    func addEightNeutronParTickThenCallTickAGivenAmountOfTimesThenCountEnergy(
        ticks: Int, expectedEnergy: Float) async throws {

        // Arrange.
        let expected: Energy = try Energy(expectedEnergy)
        for _ in 1...ticks {
            try await service.addNeutron(8)
            await service.tick()
        }

        // Act.
            let actual: Energy = await service.energy

        // Assert.
        #expect(actual == expected)
    }

    @Test("We should have nothing more in the system after a while")
    func addEightNeutronParTickThenCallTickAHugeAmountOfTimesShouldBeZero() async throws {

        // Arrange.
        let ticks: Int = 1_000_000
        let expected: Int = 0
        for _ in 1...ticks {
            try await service.addNeutron(8)
            await service.tick()
        }

        // Act.
        let actual: Int = await service.fissibleCount

        // Assert.
        #expect(actual == expected)
    }

    @Test("We should have exactly 0 fissibles in the system after this exact count")
    func addEightNeutronParTickThenCallTickThisExactAmountOfTimesShouldBeFour() async throws {

        // Arrange.
        let ticks: Int = 1_139
        let expected: Int = 0
        for _ in 1...ticks {
            try await service.addNeutron(8)
            await service.tick()
        }

        // Act.
        let actual: Int = await service.fissibleCount

        // Assert.
        #expect(actual == expected)
    }

    @Test("We should have nothing more in the system after this exact count")
    func addEightNeutronParTickThenCallTickThisExactAmountOfTimesShouldBeZero() async throws {

        // Arrange.
        let ticks: Int = 1_140
        let expected: Int = 0
        for _ in 1...ticks {
            try await service.addNeutron(8)
            await service.tick()
        }

        // Act.
        let actual: Int = await service.fissibleCount

        // Assert.
        #expect(actual == expected)
    }

    @Test("We should have this exact amount of energy in the system after this exact count of ticks")
    func addEightNeutronParTickThenCallTickThisExactAmountOfTimesShouldBeThisExactAmountOfEnergy() async throws {

        // Arrange.
        let ticks: Int = 1_141
        let expected: Energy = Energy(unsafeValue: 0.001)
        for _ in 1...ticks {
            try await service.addNeutron(8)
            await service.tick()
        }

        // Act.
        let actual: Energy = await service.energy

        // Assert.
        #expect(actual == expected)
    }
}
