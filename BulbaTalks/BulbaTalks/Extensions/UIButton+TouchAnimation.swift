import UIKit

extension UIButton {
    /**
     Parameters for button animation.
     */
    private enum ButtonAnimationParameter {
        /**
         Shows how long every animation after touch will be last.
         */
        static let animationDuration = 0.1

        /**
         Shows how to change the scale (x and y)
         of the button by the animation after touch.
         */
        static let scaleTransformation: CGFloat = 0.95
    }

    /**
     The animation after touch of the button which changes
     a scale (x and y) of the button for some duration and
     then return originals scale back.
     */
    func touchAnimation() {
        UIButton.animate(withDuration: ButtonAnimationParameter.animationDuration,
                         animations: {
                             self.transform = CGAffineTransform(scaleX: ButtonAnimationParameter.scaleTransformation,
                                                                y: ButtonAnimationParameter.scaleTransformation)
                         },
                         completion: { _ in
                             UIButton.animate(withDuration: ButtonAnimationParameter.animationDuration, animations: {
                                 self.transform = CGAffineTransform.identity
                           })
                         })
    }
}
