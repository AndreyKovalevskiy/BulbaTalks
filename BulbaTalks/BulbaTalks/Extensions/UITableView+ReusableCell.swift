import UIKit

/**
 Provides the ability to create and dequeue the cell.
 */
extension UITableView {
    /**
     Loads the cell from the xib resource file and
     registers it with the table view.
     The xib file should be in the main bundle.
     - Parameter _: The class type of the cell to register.
     */
    func registerCell<T: UITableViewCell>(of _: T.Type) {
        let nibFileWithCell = UINib(nibName: T.reuseIdentifier, bundle: nil)
        register(nibFileWithCell, forCellReuseIdentifier: T.reuseIdentifier)
    }

    /**
     Dequeues an existing cell if one is available or creates
     a new one using the class or nib file you previously registered.
     - Parameter _: The class type of the cell to dequeue.
     - Returns: The reusable cell or `nil` if no cell is available
     for reuse and you did not register a class or nib file.
     */
    func dequeueCell<T: UITableViewCell>(of _: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T
    }
}
