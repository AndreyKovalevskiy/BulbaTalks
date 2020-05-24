import UIKit

class ResourceProvider {
    /**
     Function to getting UIImage from assets
     - parameter by: Image name in assets.
     - parameter completion: Escaping closure.
     */
    static func getImage(by path: String, completion: @escaping (UIImage?) -> Void) {
        let image = UIImage(named: path)
        completion(image)
    }
}
