import UIKit

/**
 Contains properties of the class `UIImageView` that
 will render in Interface Builder in real-time.
 These properties will be set in the Attributes inspector,
 modifing them allows see the image view getting updated
 in real-time within the storyboard.
 To get these properties needs to set in Identity Inspector
 the `UIImageView` to `RoundedImageView` class.
 */
@IBDesignable
class RoundedImageView: UIImageView {
    /**
     Defines the radius to use when drawing
     rounded corners for the layer’s background.
     */
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
