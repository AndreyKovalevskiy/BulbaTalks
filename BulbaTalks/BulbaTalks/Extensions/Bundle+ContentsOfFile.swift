import UIKit

extension Bundle {
    /**
     Returns the contents of the file from the current bundle.
     - Parameter fileURL: The path to the file.
     - Returns: The `Data` object with the contents of the file.

        If an invalid URL was provided or the file could not be located
        at the given URL or it is impossible to construct a `Data` object,
        the method returns `nil`.
     */
    func contentsOfFile(at fileURL: URL) -> Data? {
        guard let url = url(forResource: fileURL.lastPathComponent,
                            withExtension: nil) else {
            return nil
        }
        return try? Data(contentsOf: url)
    }

    /**
     Uses to get `UIImage` from the current bundle.
     - Parameter url: Url of necessary image.
     - Parameter completion: A completion handler which takes
     `UIImage` object from URL or `nil` if the image isn't found.
     */
    func getImage(by url: String, completion: (UIImage?) -> Void) {
        let fileURL = URL(fileURLWithPath: url)
        if let data = contentsOfFile(at: fileURL),
            let image = UIImage(data: data) {
            completion(image)
        }
    }
}
