import UIKit

extension UIViewController {
    /**
     Gets the view controller identifier which uses in
     the storyboard configuration at the UIBuilder.
     */
    static var storyboardID: String {
        return "\(self)ID"
    }
}
