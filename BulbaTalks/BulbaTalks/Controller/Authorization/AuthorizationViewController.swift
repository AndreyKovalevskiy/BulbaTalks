import UIKit

class AuthorizationViewController: UIViewController {
    @IBAction func redirectToTwitterLoginPage(_ sender: UIButton) {
        let animationDuration = 0.2
        let scaleTransformation: CGFloat = 0.9
        UIButton.animate(withDuration: animationDuration,
                         animations: {
                             sender.transform = CGAffineTransform(scaleX: scaleTransformation, y: scaleTransformation)
                         },
                         completion: { _ in
                             UIButton.animate(withDuration: animationDuration, animations: {
                                 sender.transform = CGAffineTransform.identity
                             })
                         })
    }
}
