import UIKit

extension UIButton {
    /**
     Parameters for button animation.
     */
    private enum AnimationParameter {
        /**
         Shows how long whole scale changing animation
         after touch will be last.
         */
        static let animationScaleChangingDuration = 0.2

        /**
         Shows how to change the scale (x and y)
         of the button by the animation after touch.
         */
        static let scaleTransformation: CGFloat = 0.95
    }

    /**
     The animation after touch of the button which changes
     a scale (x and y) of the button for some duration and
     then return original scale back.
     */
    func touchAnimation() {
        let halfAnimationDuration = AnimationParameter.animationScaleChangingDuration / 2
        UIButton.animate(withDuration: halfAnimationDuration,
                         animations: scaleTransform,
                         completion: { [weak self] _ in
                             if let button = self {
                                 button.animationTransfornToOriginalScale()
                             }
        })
    }

    private func scaleTransform() {
        transform = CGAffineTransform(
            scaleX: AnimationParameter.scaleTransformation,
            y: AnimationParameter.scaleTransformation
        )
    }

    private func animationTransfornToOriginalScale() {
        let halfAnimationDuration = AnimationParameter.animationScaleChangingDuration / 2
        UIButton.animate(withDuration: halfAnimationDuration,
                         animations: {
                             self.transform = CGAffineTransform.identity
         })
    }
}
