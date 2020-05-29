import UIKit

class AuthorizationViewController: UIViewController {
    @IBOutlet var loginButton: LoginButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.backgroundColor = UIColor.Twitter.primaryBlue
    }

    @IBAction func redirectToTwitterLoginPage(_: Any) {}
}
