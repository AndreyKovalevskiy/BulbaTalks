import UIKit

class AuthorizationViewController: UIViewController {
    @IBAction func redirectToTwitterLoginPage(_ sender: UIButton) {
        UIButton.animate(withDuration: 0.2,
                         animations: {
                             sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                         },
                         completion: { _ in
                             UIButton.animate(withDuration: 0.2, animations: {
                                 sender.transform = CGAffineTransform.identity
        })
        })
    }
}
