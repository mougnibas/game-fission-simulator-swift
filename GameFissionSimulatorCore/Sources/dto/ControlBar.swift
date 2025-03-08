// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation

/// A control bar.
///
/// It is used to consome neutron inside a system.
/// The more the bar is inside the system, the more it will consume neutrons.
/// Pushing or pulling the bar from the system can control the fission reaction.
public struct ControlBar: CustomStringConvertible {

    /// Minimal "move" mouvement value.
    private static let moveValue: Float = 0.01

    /// Minimal value (fully pulled).
    private static let minValue: Float = 0.0

    /// Maximal value (fully pushed).
    private static let maxValue: Float = 1.0

    /// The  value of the mass.
    public var value: Float

    /// A formated representation of the value.
    public let valueFormated: String

    /// A string description of the class.
    public let description: String

    /// Initiallise the control bar from unsafe values.
    ///
    /// - Parameter unsafeValue : Unsafe value to be use.
    private init (unsafeValue: Float) {

        // Set the internal value.
        self.value = unsafeValue

        // Set "formated".
        valueFormated = value.formatted(
            .number
                .grouping(.automatic)
                .locale(Locale(identifier: "en_US_POSIX"))
                .precision(.integerAndFractionLength(integer: 1, fraction: 8)))

        // Set "description".
        description = "ControlBar(value='\(valueFormated)')"
    }

    /// Initialize the control bar at a default state.
    ///
    /// Default state will be "fully pulled" (0.0 value).
    public init() {
        self.init(unsafeValue: 0.0)
    }

    /// Initialize the control bar.
    ///
    /// - Parameter value : The value of the control bar.
    /// 0.0 mean the bar is can not consume neutron (fully pulled from the system).
    /// 1.0 mean the bar is fully inserted and consume all neutron it can absorb (fully pushed into the system).
    ///
    /// - throws : ``InvalidInputError`` if `value` is not between 0.0 and 1.0.
    public init(_ value: Float) throws(InvalidInputError) {

        // Test if the value is between 0.0 and 1.0.
        if value < ControlBar.minValue || value > ControlBar.maxValue {
            throw InvalidInputError("ControlBar value must be between 0.0 and 1.0.")
        }

        // Use the internal constructor.
        self.init(unsafeValue: value)
    }

    /// Push "a little" the bar in the system.
    public mutating func push() {

        // Push the control bar
        value += ControlBar.moveValue

        // If the control bar is now fully pushed, affect the max value.
        if value > ControlBar.maxValue {
            value = ControlBar.maxValue
        }
    }

    /// Pull "a little" the bar from the system.
    public mutating func pull() {

        // Pull the control bar.
        value -= ControlBar.moveValue

        // If the control bar is now fully pulled, affect the min value.
        if value < ControlBar.minValue {
            value = ControlBar.minValue
        }
    }
}
