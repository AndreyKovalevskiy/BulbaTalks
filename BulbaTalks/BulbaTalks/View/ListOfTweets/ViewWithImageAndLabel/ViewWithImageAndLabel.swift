import UIKit

class ViewWithImageAndLabel: UIView {
    // MARK: Properties
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var imageButton: UIImageView!
    @IBOutlet weak var count: UILabel!
    
    var textCout: String? {
        get {
            return count.text
        }
        set (textCoutLabel) {
            count.text = textCoutLabel
        }
    }
}
