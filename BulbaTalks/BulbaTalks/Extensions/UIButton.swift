import UIKit

extension UIButton {
    /**
     Parameters for button animation.
     */
    private enum ButtonAnimationParameter {
        /**
         Shows how long animation after touch will be last.
         */
        static let animationDurationAfterTouch = 0.1

        /**
         Shows how to change the scale (x and y)
         of the button by the animation after touch.
         */
        static let scaleTransformationAfterTouch: CGFloat = 0.95
    }

    /**
     The animation after touch of the button which changes
     a scale (x and y) of the button for some duration.
     */
    func touchAnimation(of button: UIButton) {
        UIButton.animate(withDuration: ButtonAnimationParameter.animationDurationAfterTouch,
                         animations: {
                             button.transform = CGAffineTransform(scaleX: ButtonAnimationParameter.scaleTransformationAfterTouch,
                                                                  y: ButtonAnimationParameter.scaleTransformationAfterTouch)
                         },
                         completion: { _ in
                             UIButton.animate(withDuration: ButtonAnimationParameter.animationDurationAfterTouch, animations: {
                                 button.transform = CGAffineTransform.identity
                            })
                        })
    }
}
