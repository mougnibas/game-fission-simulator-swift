// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation
import Testing
@testable import GameFissionSimulatorCore

/// Unit tests of ``Mass`` struct.
@Suite("Neutron unit test")
struct NeutronUnitTests {

    @Test("Default constructor have this description")
    func defaultConstructorHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Neutron()"
        let neutron: Neutron = Neutron()

        // Act.
        let actual: String = neutron.description

        // Assert.
        #expect(actual == expected)
    }
}
