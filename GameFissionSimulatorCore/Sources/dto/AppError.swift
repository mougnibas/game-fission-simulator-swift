// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation

/// Application errors.
public struct AppError: Error {

    /// Kind of errors.
    enum ErrorKind {

        /// Input is invalid.
        case invalidInput

        /// Doing this will result into something being too small.
        case tooSmall
    }

    /// Kind of error.
    let kind: ErrorKind

    /// Associated error message.
    let message: String

}
