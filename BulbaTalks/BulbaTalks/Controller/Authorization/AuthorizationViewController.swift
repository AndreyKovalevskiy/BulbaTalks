import UIKit

class AuthorizationViewController: UIViewController {
    /**
     Parameters for the log in button animation.
     */
    private enum LoginButtonParameter {
        /**
         Shows how long animation after touch will be last.
         */
        static let animationDurationAfterTouch = 0.4

        /**
         Shows how to change the scale (x and y)
         of the button by the animation after touch.
         */
        static let scaleTransformationAfterTouch: CGFloat = 0.95
    }

    @IBAction func redirectToTwitterLoginPage(_ sender: UIButton) {
        // The animation after touch of the log in button
        // which changee scale (x and y) of the button for
        // some duration.
        UIButton.animate(withDuration: LoginButtonParameter.animationDurationAfterTouch,
                         animations: {
                             sender.transform = CGAffineTransform(scaleX: LoginButtonParameter.scaleTransformationAfterTouch,
                                                                  y: LoginButtonParameter.scaleTransformationAfterTouch)
                         },
                         completion: { _ in
                             UIButton.animate(withDuration: LoginButtonParameter.animationDurationAfterTouch, animations: {
                                 sender.transform = CGAffineTransform.identity
                             })
                         })
    }
}
