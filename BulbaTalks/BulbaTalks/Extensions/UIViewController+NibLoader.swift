import UIKit

/**
 Provides the ability to get the contents of the nib file.
 */
protocol NibLoader {
    /**
     Returns the contents of the nib file from the main bundle.
     - Returns: The `UINib` object with the contents of the nib file.
     */
    func getNib() -> UINib
}

extension UIViewController: NibLoader {
    func getNib() -> UINib {
        return UINib(nibName: String(describing: type(of: self)), bundle: nil)
    }
}
