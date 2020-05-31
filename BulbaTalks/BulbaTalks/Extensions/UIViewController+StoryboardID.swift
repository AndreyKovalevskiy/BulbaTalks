import UIKit

extension UIViewController {
    /**
     Gets the view controller identifier which is used in
     the storyboard configuration at the interface builder.
     */
    static var storyboardID: String {
        return "\(self)ID"
    }
}
