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
public struct ControlBar: CustomStringConvertible, Equatable, Sendable {

    /// Minimal "move" mouvement value.
    private static let moveValue: Int = 1

    /// Minimal value (fully pulled).
    private static let minValue: Int = 0

    /// Maximal value (fully pushed).
    private static let maxValue: Int = 100

    /// Maximum amount of neutron the control bar can consume when fully pushed.
    public static let maxConsummableNeutron: Int = 1_000

    /// The  value of the mass.
    private(set) var value: Int

    /// A formated representation of the value.
    public let valueFormated: String

    /// A string description of the class.
    public let description: String

    /// Initiallise the control bar from unsafe values.
    ///
    /// - Parameter unsafeValue : Unsafe value to be use.
    internal init (unsafeValue: Int) {

        // Set the internal value.
        self.value = unsafeValue

        // Set "formated".
        valueFormated = value.formatted(
            .number
                .grouping(.automatic)
                .locale(Locale(identifier: "en_US_POSIX"))
                .precision(.integerLength(3)))

        // Set "description".
        description = "ControlBar(value='\(valueFormated)')"
    }

    /// Initialize the control bar at a default state.
    ///
    /// Default state will be "fully pulled" (0 value).
    public init() {
        self.init(unsafeValue: 0)
    }

    /// Initialize the control bar.
    ///
    /// - Parameter value : The value of the control bar.
    /// 0 mean the bar is can not consume neutron (fully pulled from the system).
    /// 100 mean the bar is fully inserted and consume all neutron it can absorb (fully pushed into the system).
    ///
    /// - throws : ``InvalidInputError`` if `value` is not between 0.0 and 1.0.
    public init(_ value: Int) throws(InvalidInputError) {

        // Test if the value is between 0.0 and 1.0.
        guard value >= ControlBar.minValue && value <= ControlBar.maxValue else {
            throw InvalidInputError("ControlBar value must be between 0 and 100.")
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

    /// Consume input neutron(s), then output neutron(s).
    ///
    /// Depending of the state the control bar (fully pushed, fullled pulled, half pushed, etc.) the control bar will
    /// consome a certain amount of neutrons, then will output another amount of neutrons.
    /// Fully pulled control bar will not consume any neutron.
    /// Fully pushed control bar will consume the maximum possible (``maxConsummableNeutron``)
    /// neutrons available in input.
    ///
    /// - parameter input : The input neutron(s) to filter.
    ///
    /// - returns : The filtered output neutron(s).
    public func filter(_ input: [Neutron]) -> [Neutron] {

        // Filtered neutron to return.
        var filtered: [Neutron] = []

        // Act differently according to value (fully pulled, fully push or between).
        switch value {

        // If control bar is fully pulled, it can't absorb any neutron.
        case ControlBar.minValue:
            filtered = input

        // If control bar is fully pushed, it can absorb max consummable neutrons.
        case ControlBar.maxValue:
            let consumed: Int = ControlBar.maxConsummableNeutron
            let newAmount = input.count - consumed
            filtered = Array(input[0..<newAmount])

        // If control bar is between any fully pulled or fully pushed state,
        // compute the consummable neutrons, then consume then.
        default:
            let consumed: Int = Int(
                ceil(
                    Double(ControlBar.maxConsummableNeutron) * Double(value)
                    /
                    Double(ControlBar.maxValue)
                )
            )
            let newAmount = input.count - consumed
            filtered = Array(input[0..<newAmount])
        }

        // Return the filtered neutrons
        return filtered
    }

    public static func == (lhs: ControlBar, rhs: ControlBar) -> Bool {
        let result: Bool = lhs.value == rhs.value
        return result
    }

    public static func != (lhs: ControlBar, rhs: ControlBar) -> Bool {
        let result: Bool = lhs.value != rhs.value
        return result
    }
}
