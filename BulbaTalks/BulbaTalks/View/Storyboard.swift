import UIKit

/// Storyboard contains names of application storyboards.
enum Storyboard: String {
    case authorization = "Autorization"

    /**
     Gets a view controller of the specified type that is instantiated from the current storyboard.
     - Parameter viewController: Concrete type of the view controller to instantiate.
     - Returns: View controller with type of input parameter `viewController`  or nil.
     */
    func viewController<T: UIViewController>(of viewController: T.Type) -> T? {
        let storyboard = UIStoryboard(name: rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewController.storyboardID) as? T
    }
}
