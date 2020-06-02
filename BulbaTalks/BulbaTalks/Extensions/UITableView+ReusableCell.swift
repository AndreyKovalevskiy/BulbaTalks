import UIKit

extension UITableView {
    /**
     Loads the cell from the xib resource file and
     registers it with the table view.
     The xib file should be in the main bundle.
     - Parameter type: The class type of the cell to register.
     */
    func registerCell<T: UITableViewCell>(of _: T.Type) {
        let nibFileWithCell = UINib(nibName: T.cellID, bundle: nil)
        register(nibFileWithCell, forCellReuseIdentifier: T.cellID)
    }

    /**
     Dequeues the cell that has been registered use with the table view.
     - Parameter type: The class type of the cell to dequeue.
     - Returns: The reusable cell or `nil` if no cell is available
     for reuse and you did not register a class or nib file.
     */
    func dequeueCell<T: UITableViewCell>(of _: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: T.cellID) as? T
    }
}
