import UIKit

class AuthorizationViewController: UIViewController {
    /**
     Parameters for the log in button animation.
     */
    private enum ButtonAnimationParameter {
        static let animationDuration = 0.2
        static let scaleTransformation: CGFloat = 0.9
    }

    @IBAction func redirectToTwitterLoginPage(_ sender: UIButton) {
        /**
         The log in button touch animation.
         */
        UIButton.animate(withDuration: ButtonAnimationParameter.animationDuration,
                         animations: {
                             sender.transform = CGAffineTransform(scaleX: ButtonAnimationParameter.scaleTransformation,
                                                                  y: ButtonAnimationParameter.scaleTransformation)
                         },
                         completion: { _ in
                             UIButton.animate(withDuration: ButtonAnimationParameter.animationDuration, animations: {
                                 sender.transform = CGAffineTransform.identity
                             })
                         })
    }
}
