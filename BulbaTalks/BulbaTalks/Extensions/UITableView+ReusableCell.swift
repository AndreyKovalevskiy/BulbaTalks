import UIKit

extension UITableView {
    /**
     Loads the cell from the xib resource file and
     registers it with the table view.
     The xib file should be in the main bundle.
     - Parameter type: The class type of the cell to register.
     */
    func registerCell<T: UITableViewCell>(of _: T.Type) {
        let cellName = String(describing: T.self)
        let nibFileWithCell = UINib(nibName: cellName, bundle: nil)
        register(nibFileWithCell, forCellReuseIdentifier: cellName)
    }

    /**
     Dequeues the cell that has been registered use with the table view.
     - Parameter type: The class type of the cell to dequeue.
     - Returns: The reusable cell of the `UITableView` object.
     */
    func dequeueCell<T: UITableViewCell>(of _: T.Type) -> T? {
        let cellName = String(describing: T.self)

        return dequeueReusableCell(withIdentifier: cellName) as? T
    }
}
