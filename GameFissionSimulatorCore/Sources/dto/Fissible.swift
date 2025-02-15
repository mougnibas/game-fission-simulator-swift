// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation

/// A fissible nucleous.
public struct Fissible: CustomStringConvertible {

    /// The "mass" of the fissible element.
    public let mass: Mass

    /// A string description of the class.
    public let description: String

    /// Initialize the struct with a default mass of 1.0.
    public init() {

        // Default mass
        mass = Mass()

        // Create the description
        description = "Fissible(mass='\(mass.formated)')"
    }

    /// Initialize the struct with a given mass.
    ///
    /// - Parameters :
    ///     - mass : The mass of this fissible.
    public init( _ mass: Mass) {

        // Set the mass
        self.mass = mass

        // Create the description
        description = "Fissible(mass='\(mass.formated)')"
    }
}
