// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation
import Testing
@testable import GameFissionSimulatorCore

/// Basic Unit tests of ``BusinessService`` actor.
@Suite("BusinessService basic unit test")
struct BusinessServiceBasicUnitTests {

    /// The service to test.
    private let service: BusinessService

    /// Initialize the struct (called each time before a test function is called).
    init() throws {

        // A not so random number generator.
        let rng: RandomNumberGenerator = FixedRandomNumberGenerator()
        let numberOfFissibles = 1

        // Instantiate the service with the custom rng.
        service = BusinessService(rng, numberOfFissibles)
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
    func description() async throws {

        // Arrange.
        let expected: String = "BusinessService()"

        // Act.
        let actual: String = await service.description

        // Assert.
        #expect(actual == expected)
    }

    @Test("Fissible count")
    func fissibleCount() async throws {

        // Arrange.
        let expected: Int = 1

        // Act.
        let actual: Int = await service.fissibleCount

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
            await service.tick()
        }

        // Act
        let actual: Int = await service.tickCount

        // Assert.
        #expect(actual == expected)
    }

    @Test("Count the neutrons")
    func countTheNeutron() async throws {

        // Arrange.
        let expected: Int = 0

        // Act.
        let actual: Int = await service.neutronCount

        // Assert.
        #expect(actual == expected)
    }

    @Test("Count the energy")
    func countTheEnergy() async throws {

        // Arrange.
        let expected: Energy = try Energy(0.0)

        // Act.
        let actual: Energy = await service.energy

        // Assert.
        #expect(actual == expected)
    }

    @Test("Add some neutron, then count them", arguments: [1, 10, 100])
    func addNeutronsThenCountThem(numberOfNeutronToAdd: Int) async throws {

        // Arrange.
        let expected: Int = numberOfNeutronToAdd

        // Act.
        for _ in 0..<numberOfNeutronToAdd {
            await service.addNeutron()
        }
        let actual: Int = await service.neutronCount

        // Assert.
        #expect(actual == expected)
    }

    @Test("Add some neutrons directly, then count them", arguments: [1, 10, 100])
    func addNeutronsDirectlyThenCountThem(numberOfNeutronToAdd: Int) async throws {

        // Arrange.
        let expected: Int = numberOfNeutronToAdd

        // Act.
        try await service.addNeutron(numberOfNeutronToAdd)
        let actual: Int = await service.neutronCount

        // Assert.
        #expect(actual == expected)
    }

    @Test("Add zero neutron should rise an error")
    func addingZeroNeutronShouldRiseAnError() async throws {

        // Arrange, Act and Assert
        await #expect(throws: (TooSmallError).self) { try await service.addNeutron(0) }
    }

    @Test("Add negative neutron should rise an error")
    func addingNegativeNeutronShouldRiseAnError() async throws {

        // Arrange, Act and Assert
        await #expect(throws: (TooSmallError).self) { try await service.addNeutron(-1) }
    }

    @Test("Add a few neutrons, call tick, then count the fissibles")
    func addAFewNeutronsThenCallTickThenCountFissibles() async throws {

        // Arrange.
        let expected: Int = 0
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.tick()

        // Act.
        let actual: Int = await service.fissibleCount

        // Assert.
        #expect(actual == expected)
    }

    @Test("Add a few neutrons, call tick, then get the energy")
    func addAFewNeutronsThenCallTickThenGetEnergy() async throws {

        // Arrange.
        let expected: Energy = try Energy(0.001)
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.tick()

        // Act.
        let actual: Energy = await service.energy

        // Assert.
        #expect(actual == expected)
    }

    @Test("Add a few neutrons, call tick, then count the neutrons")
    func addAFewNeutronsThenCallTickThenCountNeutron() async throws {

        // Arrange.
        let expected: Int = 3
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.addNeutron()
        await service.tick()

        // Act.
        let actual: Int = await service.neutronCount

        // Assert.
        #expect(actual == expected)
    }
}
