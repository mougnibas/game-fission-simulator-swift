// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation

/// Energy released when fission occured.
public struct Energy: CustomStringConvertible, Equatable {

    /// The  value of the mass.
    public let value: Float

    /// A formated representation of the value.
    public let formated: String

    /// A string description of the class.
    public let description: String

    /// Initialize the struct with a 1.0 default value.
    public init() {

        // Call the private constructor
        self.init(value: 0.0)
    }

    /// Initialize the struct with the given value.
    ///
    /// - Parameters :
    ///   - value : The value of the energy, between 0.0 and 1.0.
    public init( _ value: Float) throws {

        // Test if the value is between 0.0 and 1.0.
        if value < 0.0 || value > 1.0 {
            throw AppError(kind: .invalidInput, message: "Energie value must be between 0.0 and 1.0.")
        }

        // Call the private constructor
        self.init(value: value)
    }

    /// Initialize the struct without any safety check.
    ///
    /// - Parameters :
    ///   - value : The value (any float is valid).
    private init (value: Float) {

        // Set the internal value.
        self.value = value

        // Set "formated".
        formated = value.formatted(
            .number
                .grouping(.automatic)
                .locale(Locale(identifier: "en_US_POSIX"))
                .precision(.integerAndFractionLength(integer: 1, fraction: 8)))

        // Set "description".
        description = "Energy(value='\(formated)')"
    }
}
