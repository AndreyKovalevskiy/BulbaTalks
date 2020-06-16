import UIKit

class AuthorizationViewController: UIViewController {
    @IBAction func redirectToTwitterLoginPage(_: Any) {
        Authentication.signIn { isSignedIn in
            if isSignedIn, let viewController = AppStoryboard.listOfTweets.viewController(of:
                ListOfTweetsViewController.self) {
                viewController.modalPresentationStyle = .overCurrentContext
                present(viewController, animated: false, completion: nil)
            }
        }
    }
}
