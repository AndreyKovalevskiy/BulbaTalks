import UIKit

class AuthorizationViewController: UIViewController {
    @IBAction func redirectToTwitterLoginPage(_: Any) {
        // We use the stub of the signIn function.
        // If signIn is successful, the ListOfTweets
        // screen is presented.
        Authentication.signIn { isSignedIn in
            if isSignedIn, let viewController = AppStoryboard.listOfTweets.viewController(of:
                ListOfTweetsViewController.self) {
                viewController.modalPresentationStyle = .overCurrentContext
                present(viewController, animated: false, completion: nil)
            }
        }
    }
}
