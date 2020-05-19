import Foundation

extension Bundle {
    /**
     Returns the contents of the file from the current bundle.
     - Parameter fileURL: The path to the file.
     - Returns: Contents of the file or
     `nil` if the file could not be located
     or `Data()` conversion failed.
     */
    func contentsOfFile(at fileURL: URL) -> Data? {
        guard let url = url(forResource: fileURL.lastPathComponent,
                                 withExtension: nil) else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
}
