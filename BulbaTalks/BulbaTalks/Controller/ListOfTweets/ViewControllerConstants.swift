import UIKit

// swiftlint:disable nesting
/// Describes constants used to configure `UIViewController`.
struct ViewControllerConstants {
    /// Constants related to the tab bar.
    enum TabBar {
        /**
         Represents the height of the tab bar
         in landscape orientation.
         */
        static let heightInLandscapeOrientation: CGFloat = 50
    }

    /// Constants related to the `UIBarButtonItem`.
    enum BarButtonItem {
        /// Represents the width of the `UIBarButtonItem`.
        static let width: CGFloat = 30
        /// Represents the height of the `UIBarButtonItem`.
        static let height: CGFloat = 30

        /**
         Constants used to position the view
         of `UIBarButtonItem` relative to others views
         by adding constraints.
         */
        enum Position {
            /// Used to add width constraints.
            static let width: CGFloat = 30
            /// Used to add height constraints.
            static let height: CGFloat = 30
        }
    }
}
