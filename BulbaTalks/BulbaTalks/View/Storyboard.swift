import UIKit

// Enum for working with storyboards
enum Storyboard: String {
    case authorizationUserStory = "AutorizationUserStory"

    /**
     Function for getting ViewController related with the storyboard.
     - Parameter of: Type of ViewController.
     - Returns: ViewController with type of input parameter 'of'  or nil.
     */
    func viewController<T: UIViewController>(of viewController: T.Type) -> T? {
        let storyboard = UIStoryboard(name: rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewController.storyboardID) as? T
    }
}
