import UIKit

extension Bundle {
    /**
     Gets the image from the current bundle.
     - Parameter url: URL of the image within the bundle.
     - Parameter completion: A completion
     handler which takes the image from the given URL
     or `nil` if the image couldn't be found in the bundle.
     */
    func getImage(at url: URL, completion: (UIImage?) -> Void) {
        guard let data = contentsOfFile(at: url),
            let image = UIImage(data: data) else {
            completion(nil)
            return
        }
        completion(image)
    }
}
