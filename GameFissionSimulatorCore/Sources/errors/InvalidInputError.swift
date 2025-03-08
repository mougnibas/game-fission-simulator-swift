// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

/// An error about an invalid input.
public struct InvalidInputError: Error {

    /// Error message.
    let message: String

    /// Initialize the error.
    ///
    /// - parameter message : The error message.
    public init(_ message: String) {
        self.message = message
    }
}
