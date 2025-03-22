// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation

/// The product of a a fissible nucleous.
public struct FissionProduct: CustomStringConvertible {

    /// Released energy.
    public let energy: Energy

    /// Neutrons created.
    public let neutronCount: Int

    /// A string description of the class.
    public let description: String

    /// Fully initialize the struct.
    ///
    /// - Parameters :
    ///  - energy: The released energy.
    public init(_ energy: Energy) {

        // Set all members, except the calculated one (description).
        self.energy = energy
        self.neutronCount = 3

        // Create the description
        description = "FissionProduct(energy='\(energy)', neutronCount='\(neutronCount)')"
    }
}
