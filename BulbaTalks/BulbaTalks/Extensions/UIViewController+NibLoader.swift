import UIKit

public protocol NibLoader {
    func getNibFile() -> UINib
}

extension UIViewController: NibLoader {
    public func getNibFile() -> UINib {
        return UINib(nibName: String(describing: type(of: self)), bundle: .main)
    }
}
