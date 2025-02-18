// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation

/// The product of a a fissible nucleous.
public struct FissionProduct: CustomStringConvertible {

    /// A smaller fissible (A).
    public let fissibleA: Fissible

    /// A smaller fissible (B).
    public let fissibleB: Fissible

    /// Released energy.
    public let energy: Energy

    /// A string description of the class.
    public let description: String

    /// Fully initialize the struct.
    ///
    /// - Parameters :
    ///  - fissibleA : The first fiisssible.
    ///  - fissibleB : The second fissible.
    ///  - energy: The released energy.
    public init(_ fissibleA: Fissible, _ fissibleB: Fissible, _ energy: Energy) {

        // Set all members, except the calculated one (description).
        self.fissibleA = fissibleA
        self.fissibleB = fissibleB
        self.energy = energy

        // Create the description
        description = "FissionProduct(fissibleA='\(fissibleA)', fissibleB='\(fissibleB)', energy='\(energy)')"
    }
}
