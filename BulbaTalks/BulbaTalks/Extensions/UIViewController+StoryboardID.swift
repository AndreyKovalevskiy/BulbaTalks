import UIKit

extension UIViewController {
    /**
     Identifier of current view controller, which we use in the storyboard
     configuration.
     */
    static var storyboardID: String {
        return "\(self)ID"
    }
}
