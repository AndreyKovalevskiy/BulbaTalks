import UIKit

/**
 Provides the ability to register and dequeue the cell
 available to be reused, placed into a queue
 when the cell scrolls off the screen.
 */
extension UITableView {
    /**
     Loads the cell from the xib resource file and
     registers it with the table view.
     The xib file should be in the main bundle.
     - Parameter typeCell: The class type of the cell to register.
     */
    func registerCell<T: UITableViewCell>(of typeCell: T.Type) {
        let nibFileWithCell = UINib(nibName: typeCell.reuseIdentifier, bundle: nil)
        register(nibFileWithCell, forCellReuseIdentifier: typeCell.reuseIdentifier)
    }

    /**
     Dequeues an existing available cell, placed into a queue
     when the cell scrolls off the screen, or creates
     a new one using the class or nib file you previously registered.
     - Parameter typeCell: The class type of the cell to dequeue.
     - Returns: The reusable cell or `nil` if no cell is available
     for reuse and you did not register a class or nib file.
     */
    func dequeueCell<T: UITableViewCell>(of typeCell: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: typeCell.reuseIdentifier) as? T
    }
}
