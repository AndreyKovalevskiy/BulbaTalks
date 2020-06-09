import UIKit

/**
 Contains properties of the class `UIButton` that
 will render in Interface Builder in real-time.
 These properties will be set in the Attributes inspector,
 modifing them allows see the button getting updated
 in real-time within the storyboard.
 To get these properties needs to set in Identity Inspector
 the `UIButton` to `ImageButton` class.
 */
@IBDesignable
class ImageButton: UIButton {
    /**
     Defines the radius to use when drawing
     rounded corners for the layer’s background.
     */
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

    /**
     A boolean indicating whether sublayers are clipped to the layer’s bounds.
     When the value of this property is `true`, sublayers of the layer
     that extend outside its boundaries will be clipped to those boundaries.
     When the value of this property is `false`, no clipping occurs.
     */
    @IBInspectable var masksToBounds: Bool = false {
        didSet {
            layer.masksToBounds = masksToBounds
        }
    }
}
