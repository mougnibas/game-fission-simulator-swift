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

    @Test("Create a new system, then count the neutrons")
    func createANewSystemThenCountTheNeutron() throws {

        // Arrange.
        let expected: Int = 0

        // Act.
        let actual: Int = service.countNeutrons()

        // Assert.
        #expect(actual == expected)
    }

    @Test("Create a new system, then count the energy")
    func createANewSystemThenCountTheEnergy() throws {

        // Arrange.
        let expected: Energy = try Energy(0.0)

        // Act.
        let actual: Energy = service.getEnergy()

        // Assert.
        #expect(actual == expected)
    }

    @Test("Add a neutron, then count them")
    func addThenCountNeutrons() throws {

        // Arrange.
        let expected: Int = 1

        // Act.
        service.addNeutron()
        let actual: Int = service.countNeutrons()

        // Assert.
        #expect(actual == expected)
    }

    @Test("Add some neutron, then count them", arguments: [1, 10, 100])
    func addNeutronsThenCountThem(numberOfNeutronToAdd: Int) throws {

        // Arrange.
        let expected: Int = numberOfNeutronToAdd

        // Act.
        for _ in 0..<numberOfNeutronToAdd {
            service.addNeutron()
        }
        let actual: Int = service.countNeutrons()

        // Assert.
        #expect(actual == expected)
    }

    @Test("Add some neutrons directly, then count them", arguments: [1, 10, 100])
    func addNeutronsDirectlyThenCountThem(numberOfNeutronToAdd: Int) throws {

        // Arrange.
        let expected: Int = numberOfNeutronToAdd

        // Act.
        try service.addNeutron(numberOfNeutronToAdd)
        let actual: Int = service.countNeutrons()

        // Assert.
        #expect(actual == expected)
    }

    @Test("Add zero neutron should rise an error")
    func addingZeroNeutronShouldRiseAnError() throws {

        // Arrange, Act and Assert
        #expect(throws: (any Error).self) { try service.addNeutron(0) }
    }

    @Test("Add negative neutron should rise an error")
    func addingNegativeNeutronShouldRiseAnError() throws {

        // Arrange, Act and Assert
        #expect(throws: (any Error).self) { try service.addNeutron(-1) }
    }

    @Test("Create a new system, add 8 neutrons, call tick, then count the fissibles")
    func addEightNeutronsThenCallTickThenCountFissible() async throws {

        // Arrange.
        let expected: Int = 2
        for _ in 1...8 {
            service.addNeutron()
        }
        service.tick()

        // Act.
        let actual: Int = service.fissibleCount

        // Assert.
        #expect(actual == expected)
    }

    @Test("Create a new system, add 8 neutrons, call tick, then count the energy")
    func addEightNeutronsThenCallTickThenCountEnergy() async throws {

        // Arrange.
        let expected: Energy = try Energy(0.001)
        for _ in 1...8 {
            service.addNeutron()
        }
        service.tick()

        // Act.
        let actual: Energy = service.getEnergy()

        // Assert.
        #expect(actual == expected)
    }

    @Test("Create a new system, add 8 neutrons, call tick, then count the protons")
    func addEightNeutronsThenCallTickThenCountProtons() async throws {

        // Arrange.
        let expected: Int = 3
        for _ in 1...8 {
            service.addNeutron()
        }
        service.tick()

        // Act.
        let actual: Int = service.countNeutrons()

        // Assert.
        #expect(actual == expected)
    }

    @Test("Create a new system, add a few neutrons and call ticks a few times, then count the energy", arguments: zip(
    [10,
     20],
    [try Energy(0.002),
     try Energy(0.01)]))
    func addNeutronAndCallTickAFewTimesThenCountEnergy(ticks: Int, expected: Energy) async throws {

        // Arrange.
        for _ in 1...ticks {
            service.addNeutron()
            service.tick()
        }

        // Act.
        let actual: Energy = service.getEnergy()

        // Assert.
        #expect(actual == expected)
    }

    @Test("Create a new system, add 8 neutrons per ticks, repeat a given amout of times, then count the fissibles",
          arguments: zip(
        [10, 100, 200, 300, 400, 500],
        [29, 85, 41, 18, 12, 0]))
    func addEightNeutronParTickThenCallTickAGivenAmountOfTimesThenCountFissibles(
        ticks: Int, expected: Int) async throws {

        // Arrange.
        for _ in 1...ticks {
            try service.addNeutron(8)
            service.tick()
        }

        // Act.
        let actual: Int = service.fissibleCount

        // Assert.
        #expect(actual == expected)
    }
}
