import UIKit

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension UITableViewCell: ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
